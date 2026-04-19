// Read currently-selected Claude model.
const btn = document.querySelector('button[data-testid^="model"]');
if (!btn) return { ok: false, err: 'model switcher not found' };
return {
  ok: true,
  label: (btn.textContent || '').trim(),
  ariaLabel: btn.getAttribute('aria-label') || null
};
