// Read currently-selected Gemini mode (2.5 Pro / 2.5 Flash / Deep Think / etc).
const btn = document.querySelector('[data-test-id="bard-mode-menu-button"]');
if (!btn) return { ok: false, err: 'mode menu button not found' };
return {
  ok: true,
  label: (btn.textContent || '').trim(),
  ariaLabel: btn.getAttribute('aria-label') || null
};
