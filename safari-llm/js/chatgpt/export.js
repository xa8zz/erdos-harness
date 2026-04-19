// Export current ChatGPT conversation as {title, url, messages: [{role, text}]}.
const msgs = [];
for (const el of document.querySelectorAll('[data-message-author-role]')) {
  const role = el.getAttribute('data-message-author-role');
  // Grab markdown-ish text: use .markdown element if present, else innerText
  const md = el.querySelector('.markdown') || el;
  msgs.push({ role, text: (md.innerText || '').trim() });
}
return {
  title: document.title.replace(/^ChatGPT\s*[-—|:]\s*/, '').trim() || document.title,
  url: location.href,
  messages: msgs
};
