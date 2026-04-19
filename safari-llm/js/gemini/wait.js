// Wait for Gemini response.
// Signals: <p class="pending"> in the response (streaming animation state);
//          response text length stable (use textContent — innerText is hidden by pending-class CSS).
async function __wait(maxSeconds) {
  const started = Date.now();
  const deadline = started + maxSeconds * 1000;
  const lastResponse = () => {
    const resps = document.querySelectorAll('response-container .markdown-main-panel');
    return resps[resps.length - 1];
  };
  const hasPending = () => {
    const r = lastResponse();
    return r ? !!r.querySelector('.pending') : false;
  };
  await new Promise(r => setTimeout(r, 600));
  // Wait for first pending marker to appear
  for (let i = 0; i < 20; i++) {
    if (hasPending() || lastResponse()) break;
    await new Promise(r => setTimeout(r, 200));
  }
  let lastLen = 0;
  let stableTicks = 0;
  while (Date.now() < deadline) {
    await new Promise(r => setTimeout(r, 300));
    const r = lastResponse();
    const len = r ? (r.textContent || '').length : 0;
    if (hasPending()) { stableTicks = 0; lastLen = len; continue; }
    if (len === lastLen && len > 0) {
      stableTicks++;
      if (stableTicks >= 4) {
        return { ok: true, elapsedSec: Math.round((Date.now() - started) / 100) / 10, finalLen: len };
      }
    } else { stableTicks = 0; lastLen = len; }
  }
  return { ok: false, timedOut: true, elapsedSec: Math.round((Date.now() - started) / 100) / 10 };
}
