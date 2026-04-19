// Gemini sidebar thread list.
// Conversations are <a data-test-id="conversation" href="/app/<id>?pageId=none">.
// Only visible ones render — the sidebar may lazy-load on scroll.
const items = [...document.querySelectorAll('a[data-test-id="conversation"]')];
return items.map(a => {
  const href = a.getAttribute('href') || '';
  const titleEl = a.querySelector('.conversation-title');
  const title = (titleEl?.textContent || a.textContent || '').trim() || '(untitled)';
  return {
    href,
    url: new URL(href, location.origin).href,
    title
  };
});
