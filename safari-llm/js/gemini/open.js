// Navigate to a Gemini thread.
async function __open(ref) {
  const links = [...document.querySelectorAll('a[data-test-id="conversation"]')];
  let target = null;
  if (typeof ref === 'number' || /^\d+$/.test(String(ref))) {
    const i = parseInt(ref, 10) - 1;
    if (i >= 0 && i < links.length) target = links[i];
  } else if (String(ref).startsWith('http') || String(ref).startsWith('/app/')) {
    const path = String(ref).startsWith('http') ? new URL(ref).pathname + new URL(ref).search : String(ref);
    target = links.find(a => a.getAttribute('href') === path || a.getAttribute('href').split('?')[0] === path.split('?')[0]);
  } else {
    const needle = String(ref).toLowerCase();
    target = links.find(a => (a.textContent || '').toLowerCase().includes(needle));
  }
  if (!target) throw new Error(`no sidebar thread matching ${JSON.stringify(ref)}`);
  const href = target.getAttribute('href');
  target.click();
  const deadline = Date.now() + 10000;
  while (Date.now() < deadline) {
    if (document.querySelector('user-query, model-response')) {
      return { ok: true, href, url: location.href };
    }
    await new Promise(r => setTimeout(r, 150));
  }
  return { ok: false, reason: 'navigation did not complete', currentPath: location.pathname };
}
