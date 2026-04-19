// Wait for ChatGPT response to finish.
// Signals:
//   - `.result-thinking` class is applied to the assistant markdown while generating
//   - stop button visible during streaming
//   - body length stable as a secondary check
async function __wait(maxSeconds) {
  const started = Date.now();
  const deadline = started + maxSeconds * 1000;
  const hasStop = () => !!document.querySelector('button[data-testid="stop-button"], button[aria-label="Stop generating"]');
  const stillThinking = () => !!document.querySelector('[data-message-author-role="assistant"] .result-thinking');
  await new Promise(r => setTimeout(r, 400));
  let lastLen = document.body.innerText.length;
  let stableTicks = 0;
  while (Date.now() < deadline) {
    await new Promise(r => setTimeout(r, 250));
    if (hasStop() || stillThinking()) { stableTicks = 0; lastLen = document.body.innerText.length; continue; }
    const len = document.body.innerText.length;
    if (len === lastLen) {
      stableTicks++;
      if (stableTicks >= 6) {
        return { ok: true, elapsedSec: Math.round((Date.now() - started) / 100) / 10, finalLen: len };
      }
    } else { stableTicks = 0; lastLen = len; }
  }
  return { ok: false, timedOut: true, elapsedSec: Math.round((Date.now() - started) / 100) / 10 };
}
