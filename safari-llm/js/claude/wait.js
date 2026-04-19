// Wait for Claude response. Primary signal: [data-is-streaming="true"] absent.
async function __wait(maxSeconds) {
  const started = Date.now();
  const deadline = started + maxSeconds * 1000;
  const stillStreaming = () => !!document.querySelector('[data-is-streaming="true"]');
  await new Promise(r => setTimeout(r, 400));
  // Wait for streaming marker to *appear* first (gives generation a chance to start)
  let seenStreaming = false;
  for (let i = 0; i < 20; i++) {
    if (stillStreaming()) { seenStreaming = true; break; }
    await new Promise(r => setTimeout(r, 200));
  }
  // Now wait for it to go away
  let stableTicks = 0;
  while (Date.now() < deadline) {
    await new Promise(r => setTimeout(r, 250));
    if (stillStreaming()) { stableTicks = 0; continue; }
    stableTicks++;
    if (stableTicks >= 4) {
      return { ok: true, sawStreaming: seenStreaming, elapsedSec: Math.round((Date.now() - started) / 100) / 10 };
    }
  }
  return { ok: false, timedOut: true, elapsedSec: Math.round((Date.now() - started) / 100) / 10 };
}
