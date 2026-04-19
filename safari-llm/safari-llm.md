# safari-llm

Drive ChatGPT / Claude / Gemini tabs in Safari from the command line. No Chrome,
no CDP, no remote-debugging-port — just AppleScript + `do JavaScript` + a thin
Python wrapper. Runs against whatever tabs you already have open (signed in with
your real cookies), works without stealing focus for 90% of operations, and has
an `eval` escape hatch for anything the high-level commands don't cover.

---

## Why this exists

The repo previously drove these sites via `agent-browser` / Chrome DevTools
Protocol (see `chat-export/`). That works but requires launching Chrome with
`--remote-debugging-port=<N>`, which is disruptive on a daily browser.
safari-llm does the same job against Safari, which:

- Has an AppleScript dictionary (`do JavaScript` into any open tab) — no launch
  flags required.
- Doesn't need focus for DOM reads, so exports / threads / eval all run silently
  in the background while you do other work.
- Uses Safari's real session cookies, so authentication "just works" — no
  session-token plumbing.

The tradeoff is Safari's background-tab throttling (see
[Constraints](#constraints)) which we work around with `--activate` /
`--keep-active` flags. If you need a truly background-streaming harness,
agent-browser + Chrome is still the right tool.

---

## Requirements

- **macOS**, Safari — any recent version (tested on Safari 18 / Safari 19 era).
- **Python 3** — stdlib only (argparse, subprocess, json).
- **Logged into chatgpt.com / claude.ai / gemini.google.com** in Safari (at
  least the tabs you intend to drive).

## One-time setup

1. **Enable the Develop menu in Safari**
   Safari → Settings → Advanced → check **"Show features for web developers"**.

2. **Allow JavaScript from Apple Events**
   New Develop menu in the menu bar → check **"Allow JavaScript from Apple Events"**.
   This is what lets `do JavaScript` run in your tabs.

3. **Grant Automation permission**
   First time you run safari-llm, macOS will prompt: *"<parent app> wants to control Safari."*
   Click **OK**. The parent app is whatever runs your shell — Terminal.app,
   iTerm2, Claude Code, etc.

4. **Make the CLI executable**
   ```bash
   chmod +x safari-llm/safari-llm
   ```
   Optionally symlink to your PATH:
   ```bash
   ln -s "$PWD/safari-llm/safari-llm" ~/bin/safari-llm
   ```

That's it. No Chrome flags, no CDP, no extensions.

---

## Architecture

```
┌─────────────────────┐  subprocess   ┌───────────┐  Apple Event   ┌────────┐
│ safari-llm (python) │ ────────────► │ osascript │ ─────────────► │ Safari │
│   - argparse CLI    │               └───────────┘                │  tab   │
│   - provider JS     │                                            │ (runs  │
│     library loader  │                                            │  JS in │
│   - Python polling  │ ◄──────── stdout ─────────── stderr ◄───── │  page) │
└─────────────────────┘                                            └────────┘
```

**How JS reaches the page.** Each command dispatches an AppleScript like:

```applescript
tell application "Safari"
  tell tab 3 of window 1
    do JavaScript "…your code…"
  end tell
end tell
```

**Why not base64 + `eval()`?** The first implementation encoded JS as base64
and ran `eval(atob(...))` inside the page. That silently fails — ChatGPT /
Claude / Gemini all have `script-src 'self'` CSP headers that block `eval` and
`new Function`. Safari's outer `do JavaScript` bypasses CSP for the code it
injects (because it's treated like an inline `<script>` from the browser
itself, not from the page), but anything that code hands back to `eval`
runs under the page's CSP and dies.

**Current approach.** JS is embedded **directly** in the AppleScript string
literal. Escaping rules: `\` → `\\`, `"` → `\"`, newlines pass through as-is
(AppleScript string literals accept literal line breaks). See
`_escape_for_applescript_string` in `safari-llm`.

**Return values.** `do JavaScript` returns the last-evaluated expression as a
string to AppleScript. The Python wrapper wraps every call in:

```js
(function(){
  try {
    const __r = (function(){ …your code… })();
    return '__OK__' + JSON.stringify(__r === undefined ? null : __r);
  } catch(e) {
    return '__ERR__' + JSON.stringify({err: String(e), stack: e.stack});
  }
})()
```

Sentinel-prefixed JSON means Python can unambiguously distinguish
success / JS exception / AppleScript error.

**Sync vs async (`--async`).** Sync code is wrapped in the IIFE above. Async
code (anything using `await`) needs the outer IIFE to be `async`, and Python
has to poll because Apple Events return synchronously — Safari won't wait
for a Promise to resolve. The polling pattern:

```
kick   → window.__safllm_done = false; window.__safllm_res = null;
         (async () => { try { window.__safllm_res = await …; } finally { done=true; } })();
poll   → every 100ms: if (window.__safllm_done) return JSON.stringify(__safllm_res);
         else return '__PENDING__';
```

Each poll is ~100ms of Apple-Event round-trip. Python keeps polling until done
or `--timeout` expires.

**Why Python polls `wait` (not JS).** Safari throttles **in-page**
`setTimeout` / `setInterval` in hidden tabs to ~1 Hz. A tight JS-side polling
loop stalls. But Python's `time.sleep()` runs outside the browser and isn't
throttled — so for `wait`, we do many cheap **synchronous** DOM probes from
Python, spaced by `time.sleep(0.4)`. Works even if the tab is hidden (though
streaming itself may be paused; see [Constraints](#constraints)).

**Provider JS library.** Each high-level command loads a small JS file from
`js/<provider>/<command>.js` and embeds it verbatim. Adding a provider means
dropping files into a new `js/<name>/` directory and adding a URL hint.

---

## Command reference

Every command takes a `<tab>` argument that resolves to a Safari tab
(see [Tab refs](#tab-refs)). Output is JSON on stdout unless otherwise noted.
Errors go to stderr with a `safari-llm: ` prefix and a specific exit code.

### Exit codes

| Code | Meaning |
|------|---------|
| 0    | Success |
| 1    | Usage error (bad args) |
| 2    | AppleScript error (osascript failed) |
| 3    | JS threw (error + stack on stderr) |
| 4    | DOM target not found (no matching tab, selector miss, etc.) |
| 5    | Timeout (async operation or wait) |

### `tabs`

```
safari-llm tabs
```

List every Safari tab across all windows. Output:
```json
[
  { "ref": "w1t1", "window": 1, "tab": 1, "provider": "chatgpt",
    "url": "https://chatgpt.com/…", "title": "ChatGPT" },
  …
]
```

Provider is detected from URL: `chatgpt.com` → `chatgpt`, `claude.ai` → `claude`,
`gemini.google.com` → `gemini`, else `null`.

### `new <provider> [--wait SEC] [--activate]`

Open a new Safari tab pointed at `chatgpt | claude | gemini`. Waits for
`readyState === "complete"` AND an input element to appear (so the tab is
actually usable when the command returns). Prints the new tab's ref.

```bash
ref=$(safari-llm new claude | jq -r .ref)    # w1t4
```

Options:
- `--wait SEC` (default 15): max seconds to wait for interactive. `--wait 0`
  returns immediately.
- `--activate`: also foreground Safari + make the new tab current.

**URL used**:
- `chatgpt` → `https://chatgpt.com/`
- `claude`  → `https://claude.ai/new`
- `gemini`  → `https://gemini.google.com/app`

### `focus <tab> [--activate]`

Make `<tab>` the current tab in its Safari window. Without `--activate`, this
only queues the change — Safari doesn't come to front, the user sees nothing
until they next click the Safari icon. With `--activate`, Safari is brought
to the front AND that tab is displayed.

### `close <tab>`

Close the tab. Prints `{"closed": "w1t3", "url": "…"}`.

### `eval <tab> '<js>' [--async] [--timeout SEC] [-o FILE]`

Run arbitrary JS in the tab. The escape hatch — if no high-level command does
what you need, eval can.

**Code shape.**
- Single expression (no `return`): auto-wrapped: `return (CODE);`
- Any code containing `return`, a newline, or a statement keyword (`if`,
  `for`, `throw`, `let`, `const`, …): treated as a function body — you must
  include `return` yourself for a value.
- From stdin: pass `-` as the JS arg: `echo 'code' | safari-llm eval ch -`

**`--async`.** Wraps the body in an `async function`, stashes the promise
result on `window.__safllm_res`, and polls from Python until resolved or
timeout. Required if you use `await`.

**Return values.**
- Strings, numbers, bools → printed as-is (no JSON quotes around strings).
- Objects / arrays → printed as pretty-printed JSON.
- `undefined` → prints empty string.
- `-o FILE` writes the result to a file instead of stdout.

**Examples.**
```bash
# one-liner expression
safari-llm eval chatgpt 'document.title'

# multi-statement body (you add `return`)
safari-llm eval claude '
  const links = [...document.querySelectorAll("a[href^=\"/chat/\"]")];
  return links.length;'

# async with fetch (uses your session cookies)
safari-llm eval chatgpt --async '
  const r = await fetch("/backend-api/me", {credentials:"include"});
  return {status: r.status};'

# write to file
safari-llm eval claude '
  const x = [...document.querySelectorAll("[data-is-streaming]")].pop();
  return x ? (x.querySelector(".font-claude-response")||x).textContent.trim() : null;
' -o /tmp/latest.md

# pipe a long script in
cat script.js | safari-llm eval chatgpt -
```

### `threads <tab>`

List the sidebar's conversation list. Returns `[{href, url, title}, …]`.

Provider notes:
- Claude / ChatGPT render the full sidebar eagerly.
- Gemini's sidebar is **lazy-loaded on scroll** — you'll see the top ~13 by
  default. If you need more, scroll the sidebar first via `eval`:
  `eval gemini 'document.querySelector("conversations-list")?.scrollBy(0, 99999); return "scrolled"'`.

### `open <tab> <ref>`

Navigate to a specific past thread. `<ref>` can be:
- A title substring (case-insensitive match against sidebar text)
- A full URL or path (`/c/xxx`, `/chat/xxx`, `/app/xxx`)
- A 1-based index into the current `threads` listing

Clicks the sidebar link (SPA navigation) and waits for message DOM to appear.
Note: built and wired up but lightly tested end-to-end — if the sidebar is
lazy-loaded past the target, the click won't find it. In that case, navigate
via URL directly: `eval <tab> 'location.href="/chat/<id>"; return "nav"'`.

### `model <tab> [<name>]`

Without `<name>`: read the currently selected model/mode.
With `<name>`: select the model whose visible label contains `<name>`
(substring match, case-insensitive). Opens the menu, finds the item,
clicks it.

**Provider specifics:**

- **ChatGPT** — menu has `Instant` / `Thinking` / `Pro` as `menuitemradio`.
  The trigger button text stays as `"ChatGPT"` regardless of sub-selection
  (it's the auto-router label), so `model get` opens the menu and reads which
  radio has `aria-checked="true"`, then closes the menu. Output includes both
  the trigger label and the sub-option.
- **Claude** — has three model radios (`Opus 4.7` / `Sonnet 4.6` / `Haiku 4.5`)
  plus a separate `"Extended thinking"` toggle (a `menuitem`, not a radio).
  To turn Extended off: `model claude "Extended thinking"` (toggles).
  To switch model: `model claude Haiku` etc.
- **Gemini** — modes are `Fast` / `Thinking` / `Pro` (sometimes `Deep Think`
  if your account has Ultra). `model gemini Fast` is the cheap instant.

### `send <tab> <text|-|file> [--activate] [--timeout SEC]`

Type into the prompt box and click send.

- `<text>` can be the literal text, `-` to read from stdin, or a path to a file.
- `--activate` foregrounds Safari + makes the tab current before clicking.
  Needed because:
  1. The send click should land on a focused editor, and
  2. Streaming the response requires the tab to be visible (Safari background
     throttling — see below).

**What `--activate` is NOT.** It doesn't keep Safari focused afterward — the
command returns as soon as the click succeeds, and you can alt-tab back
immediately. But any streaming fetch the page started may pause the moment
Safari loses focus.

Input is inserted via `document.execCommand('insertText', …)`. This works
reliably for short text on all three editors. For long text into
Claude's Tiptap / Gemini's Quill, truncation can occur at a few hundred chars.
See [Constraints](#constraints).

### `wait <tab> [--timeout SEC] [--activate] [--keep-active]`

Block until the tab's response stream is complete. Polls from **Python**
every 400ms with a cheap synchronous DOM probe (not a JS-side polling loop —
that would be throttled to 1 Hz on hidden tabs).

**Completion signal (per provider):**
- ChatGPT: `.result-thinking` class absent AND no `button[data-testid="stop-button"]` AND response text length stable for ~2s.
- Claude: `[data-is-streaming="true"]` absent AND response text length stable.
- Gemini: response text length stable (the `.pending` class and "Stop response"
  button persist after completion — unreliable as signals).

**Options:**
- `--activate`: foreground Safari at the start, so streaming can flow.
- `--keep-active`: if the tab is still hidden and no text progress has been
  made for 5s during polling, re-activate Safari to nudge streaming. Subject
  to a 10s cooldown between re-activations. Useful for long Thinking/Pro
  generations where you alt-tab away mid-response.

Returns:
```json
{
  "ok": true,
  "elapsedSec": 42.3,
  "finalLen": 4192,
  "sawStreaming": true,
  "sawHidden": false
}
```

### `export <tab> [--json] [-o FILE]`

Dump the conversation. By default outputs clean markdown:

```markdown
# <title>

_source: chatgpt — <url>_

## user

<text>

## assistant

<text>
```

With `--json`: outputs `{title, url, messages: [{role, text}]}`.
With `-o FILE`: writes to file instead of stdout.

Extraction selectors per provider:
- **ChatGPT**: `[data-message-author-role]`; role from the attribute; markdown
  text from `.markdown` child when present.
- **Claude**: user turns from `[data-testid="user-message"]`; assistant turns
  from `[data-is-streaming]` containers, body from `.font-claude-response`.
  Uses `textContent` (not `innerText`) because Claude's streaming animation
  temporarily hides text via CSS.
- **Gemini**: user turns from `<user-query>`; assistant turns from
  `<response-container>` → `.markdown-main-panel`. **Must use `textContent`**
  because Gemini's `<p class="pending">` CSS hides text from `innerText`
  during/after animation.

---

## Tab refs

Anywhere a command takes `<tab>`, you can pass:

| Form | Example | Meaning |
|------|---------|---------|
| Provider name | `chatgpt`, `claude`, `gemini` | First tab whose URL matches the provider's domain |
| Provider alias | `openai`, `gpt`, `anthropic`, `google`, `bard` | Same as above |
| Ref | `w1t3` | Window 1, tab 3 — stable within a Safari session |
| URL substring | `backend-api`, `/chat/abc123` | First tab whose URL contains the substring |
| Global index | `1`, `2`, `3` | N-th tab across all windows (1-based) |

**Gotcha**: when you have two tabs of the same provider open (e.g. `new claude`
on top of an existing Claude tab), `claude` matches the **first** one. For
the second, use the ref returned from `new` or explicit ref.

---

## Provider-specific notes

### ChatGPT

- The top-left model button and the composer-adjacent `Switch model` button
  open the **same menu**. No separate "Extended thinking" toggle — the three
  tiers (Instant / Thinking / Pro) are all the thinking-depth variants.
- The trigger button's text is the **auto-router label** ("ChatGPT") and
  doesn't reflect sub-selection. `model chatgpt` reads sub-selection from
  `aria-checked` on the radios inside the menu.
- `result-thinking` CSS class on the assistant message is the reliable "still
  generating" signal.
- Auth is cookie-based; `fetch('/backend-api/me', {credentials:'include'})`
  works from inside the tab. Note: OpenAI has hardened `/api/auth/session` to
  return only a warning banner (no bearer token), so the classic
  "grab token + hit /backend-api/conversation" pattern is dead in 2026.

### Claude

- Three model radios (`Opus 4.7` / `Sonnet 4.6` / `Haiku 4.5`) + a toggle
  menu item `"Extended thinking"`. Trigger label shows both concatenated,
  e.g. `"Haiku 4.5Extended"` when Extended is on, just `"Haiku 4.5"` when off.
  To turn off: `model claude "Extended thinking"` (it's a toggle).
- `data-is-streaming` attribute on the assistant container is the **cleanest
  streaming signal of the three providers**. Attr is `"true"` while generating,
  `"false"` when done.
- User message turn: `[data-testid="user-message"]`.
- Assistant message body: `.font-claude-response` inside the
  `[data-is-streaming]` container. Use `textContent`, not `innerText`.

### Gemini

- Modes: `Fast` / `Thinking` / `Pro` via `[data-test-id="bard-mode-menu-button"]`.
  `Fast` is the cheap instant model; `Deep Think` appears for Ultra accounts.
- Response DOM is deep and Angular-flavored:
  `response-container > presented-response-container > response-container-content > .response-content > structured-content-container > message-content > .markdown.markdown-main-panel > <p class="pending">`.
- **`.pending` class and "Stop response" button never clear** after streaming
  completes. Do NOT use them as done-signals. Rely on text-length stability.
- **`innerText` returns empty** on completed responses because the `.pending`
  CSS animation hides content. Always use `textContent` for Gemini response
  text extraction.
- Sidebar (`a[data-test-id="conversation"]`) lazy-loads on scroll — default
  listing is ~13 threads.

---

## Constraints

Honest list of what this can and cannot do.

### Hard limits

1. **CSP blocks `eval()` and `new Function()` inside the page.**
   Safari's outer `do JavaScript` bypasses CSP for the top-level injection, but
   anything that injected code delegates to `eval` is blocked. You can't build
   dynamic-eval systems inside the page.

2. **No real keystrokes.** `document.execCommand` covers synthetic text insert
   for ProseMirror/Tiptap/Quill and synthetic clicks, but:
   - Keyboard shortcuts (Cmd+K, Cmd+Enter, arrow-key menu nav) — `KeyboardEvent`
     is dispatched but most apps ignore it for security.
   - Long-text paste can truncate on Claude's Tiptap / Gemini's Quill at a few
     hundred chars.
   - Synthetic `ClipboardEvent` can't inject clipboard data — clipboard-paste
     attacks are blocked by the browser.

3. **File uploads.** `<input type="file">` requires a real user gesture to
   open the picker. You can `.click()` the input from JS but no picker appears
   without recent genuine interaction. Attachments are effectively unreachable
   from pure JS.

4. **Cross-origin fetch / iframe access.** Standard CORS rules. You can only
   fetch the host origin — useful, since that covers the chat backends' own
   APIs with ambient auth — but not arbitrary external URLs from inside the
   tab, and you can't read same-origin-different-host iframes (reCAPTCHA etc).

### Soft limits (workarounds)

5. **Safari background-tab throttling.** Safari aggressively throttles hidden
   tabs:
   - `setTimeout` / `setInterval` clamped to ~1 Hz.
   - Streaming fetch / SSE pauses until the tab is visible.
   - `document.hidden === true` when Safari isn't frontmost OR tab isn't
     current within Safari.

   Overriding `document.hidden` with `Object.defineProperty` fools the page's
   visibility check but does NOT unstick the underlying network throttling
   (that's at the macOS/WebKit layer, not the page's JS).

   **Workarounds in safari-llm:**
   - `wait` polls from Python, so its timer loop isn't throttled.
   - `--activate` on `send` and `wait` brings Safari to front once.
   - `--keep-active` on `wait` nudges Safari awake if streaming stalls
     mid-response.
   - Alternative for true background: run safari-llm against a **different
     macOS Space** with Safari pinned there (long-press dock icon → Options →
     Assign To This Desktop). Untested; whether macOS considers a window on
     another Space "hidden" is version-dependent.
   - Alternative #2: use the original Chrome + `agent-browser` + CDP path
     when reliable background streaming is required.

6. **Multi-MB return values from `do JavaScript` may truncate.** Haven't hit
   this in practice with conversation exports of 30+ messages. If you do:
   - Stash on `window.__x`, then eval repeatedly to return
     `window.__x.slice(offset, offset+1MB)` in chunks.
   - Or POST from inside the page to a tiny local HTTP listener; bypasses the
     Apple Event return path.

7. **Return value must be JSON-stringifiable.** DOM nodes, `Blob`, `File`,
   functions, class instances — pull out the primitive fields yourself before
   returning.

### Other gotchas

- **AppleScript reserves `tab` inside a Safari `tell` block.** Inside
  `tell application "Safari"`, `tab` refers to Safari's tab class, not the
  `\t` character. This bit me early — the CLI uses a `|\x1f|` unit separator
  instead of tab to serialize tab metadata.
- **`osascript -e` vs stdin.** The CLI uses `osascript -` (reads from stdin)
  so the AppleScript can contain multi-line strings safely without shell
  quoting issues.
- **Opening `/new` URLs doesn't reliably create empty state.** ChatGPT may
  route `https://chatgpt.com/` to the last-active conversation for some
  accounts; for a truly empty chat, use the dedicated path
  (`https://chatgpt.com/?model=gpt-5` or just accept that the first `send`
  creates the convo).

---

## Extending

### Adding a provider

1. Create `js/<name>/{send,wait_probe,export,threads,open,model_get,model_set}.js`
   following the existing pattern — each file is a function body that `return`s
   an object. `send`, `open`, `model_set` should define and call a named
   top-level function (`__send`, `__open`, `__model_set`) — see existing files
   for the pattern.
2. Add URL hints to `PROVIDER_HINTS` and `provider_of()` in `safari-llm`.
3. Add the new-tab URL to `_NEW_URLS`.

### Adding a command

1. Add a `cmd_<name>` function in `safari-llm`.
2. Register a subparser in `main()` with its flags.
3. If provider-specific, create a `js/<provider>/<name>.js` file and load via
   `provider_js(provider, '<name>')`.

### Patterns for provider JS

- **Read-only**: return a JSON-serializable object directly. No function
  wrapper needed.
- **Interactive (click + wait)**: define `async function __<verb>(arg) { … }`
  at the top level. Python appends `return __verb(arg);` to invoke with the
  user's argument JSON-encoded. Run via `async_=True`.
- **Throw for errors**: `throw new Error("…")` — Python surfaces this as
  exit code 3 with the full stack.

---

## Recipes

### Full send → wait → export loop

```bash
safari-llm model chatgpt Thinking
safari-llm send  chatgpt "Complex question here" --activate
safari-llm wait  chatgpt --activate --keep-active
safari-llm export chatgpt -o chatgpt-convo.md
```

### Interleave across three providers

```bash
safari-llm send chatgpt "prompt" --activate
safari-llm send claude  "prompt"
safari-llm send gemini  "prompt"
safari-llm wait chatgpt --activate --keep-active && safari-llm export chatgpt -o ch.md
safari-llm wait claude                            && safari-llm export claude  -o cl.md
safari-llm wait gemini                            && safari-llm export gemini  -o gm.md
```

### Extract just the last assistant message

```bash
# via export + jq
safari-llm export claude --json | \
  jq -r '[.messages[]|select(.role=="assistant")]|last|.text' > latest.md

# or via eval — ask JS for exactly what you want
safari-llm eval claude '
  const x = [...document.querySelectorAll("[data-is-streaming]")].pop();
  return x ? (x.querySelector(".font-claude-response")||x).textContent.trim() : null;
' -o latest.md
```

### Detect thinking-mode state live

```bash
safari-llm eval chatgpt '
  const a = [...document.querySelectorAll("[data-message-author-role=\"assistant\"]")].pop();
  return {
    thinking: !!a?.querySelector(".result-thinking"),
    stopBtn:  !!document.querySelector("button[data-testid=\"stop-button\"]"),
    textLen:  (a?.innerText || "").length
  };'
# poll this every few seconds to see the Instant → Thinking → streaming → done transitions
```

### Escape hatch — click a button safari-llm doesn't know about

```bash
safari-llm eval gemini '
  const btn = [...document.querySelectorAll("button")].find(b =>
    /share/i.test(b.getAttribute("aria-label") || ""));
  if (!btn) throw new Error("no share button found");
  btn.click();
  return "clicked";'
```

### New tab, switch model, send, export — one shot

```bash
ref=$(safari-llm new claude | jq -r .ref)
safari-llm model $ref Sonnet
safari-llm send  $ref "What's the best introduction to category theory?" --activate
safari-llm wait  $ref --activate --keep-active
safari-llm export $ref -o intro.md
safari-llm close $ref
```

---

## File layout

```
safari-llm/
├── README.md              (this file)
├── safari-llm             (single executable Python CLI)
└── js/
    ├── chatgpt/
    │   ├── export.js
    │   ├── model_get.js
    │   ├── model_set.js
    │   ├── open.js
    │   ├── send.js
    │   ├── threads.js
    │   ├── wait.js        (unused — older setTimeout-based; kept for reference)
    │   └── wait_probe.js  (single-shot probe invoked by Python polling)
    ├── claude/
    │   └── (same files)
    └── gemini/
        └── (same files)
```

Total: 1 Python file (~400 lines) + 21 small JS files (avg ~15 lines each).
