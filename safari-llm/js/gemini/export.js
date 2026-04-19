// Export current Gemini conversation.
// Modern Gemini DOM:
//   - user turn:     <user-query>, text inside .query-text
//   - assistant turn: <response-container>, text inside .markdown-main-panel
//     NB: during/after streaming, animated <p class="pending"> hides text via CSS —
//     use .textContent (not .innerText) to get the raw DOM text.
const turns = [...document.querySelectorAll('user-query, response-container')];
const messages = turns.map(el => {
  if (el.tagName.toLowerCase() === 'user-query') {
    const body = el.querySelector('.query-text') || el;
    return { role: 'user', text: (body.textContent || '').trim().replace(/^You said\s*/i, '') };
  }
  const md = el.querySelector('.markdown-main-panel') || el;
  return { role: 'assistant', text: (md.textContent || '').trim() };
});
return {
  title: document.title.replace(/\s*-\s*Google Gemini$/, '').replace(/^Gemini\s*[-—|:]\s*/, '').trim() || document.title,
  url: location.href,
  messages
};
