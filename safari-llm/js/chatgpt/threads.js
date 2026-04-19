// ChatGPT sidebar thread list. Returns [{href, url, title}, ...]
const items = [...document.querySelectorAll('a[href^="/c/"]')];
return items.map(a => {
  const href = a.getAttribute('href') || '';
  // Text inside the sidebar link; fall back to aria-label, then any nested [title]
  const raw = (a.textContent || '').trim();
  const aria = a.getAttribute('aria-label') || '';
  return {
    href,
    url: new URL(href, location.origin).href,
    title: raw || aria || '(untitled)'
  };
});
