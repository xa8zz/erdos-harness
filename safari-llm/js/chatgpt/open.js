// Navigate to a ChatGPT thread. Accepts:
//   - full URL (https://chatgpt.com/c/...)
//   - path (/c/...)
//   - title substring
//   - 1-based sidebar index
async function __open(ref) {
  const links = [...document.querySelectorAll('a[href^="/c/"]')];
  let target = null;
  if (typeof ref === 'number' || /^\d+$/.test(String(ref))) {
    const i = parseInt(ref, 10) - 1;
    if (i >= 0 && i < links.length) target = links[i];
  } else if (String(ref).startsWith('http') || String(ref).startsWith('/c/')) {
    const path = String(ref).startsWith('http') ? new URL(ref).pathname : String(ref);
    target = links.find(a => a.getAttribute('href') === path);
  } else {
    const needle = String(ref).toLowerCase();
    target = links.find(a => (a.textContent || '').toLowerCase().includes(needle));
  }
  if (!target) throw new Error(`no sidebar thread matching ${JSON.stringify(ref)}`);
  const href = target.getAttribute('href');
  target.click();
  // Wait for URL to change + message DOM to appear
  const deadline = Date.now() + 10000;
  while (Date.now() < deadline) {
    if (location.pathname === href && document.querySelector('[data-message-author-role]')) {
      return { ok: true, href, url: location.href };
    }
    await new Promise(r => setTimeout(r, 150));
  }
  return { ok: false, reason: 'navigation did not complete', currentPath: location.pathname };
}
