// Claude sidebar thread list.
const items = [...document.querySelectorAll('a[href^="/chat/"]')];
return items.map(a => {
  const href = a.getAttribute('href') || '';
  return {
    href,
    url: new URL(href, location.origin).href,
    title: (a.textContent || '').trim() || a.getAttribute('aria-label') || '(untitled)'
  };
});
