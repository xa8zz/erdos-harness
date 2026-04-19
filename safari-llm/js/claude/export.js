// Export current Claude conversation.
// Modern Claude DOM:
//   - user message:  [data-testid="user-message"]
//   - assistant:     [data-is-streaming]  (attr is "true" while streaming, "false" when done)
// Turns interleave in document order.
const turns = [...document.querySelectorAll('[data-testid="user-message"], [data-is-streaming]')];
const messages = turns.map(el => {
  if (el.getAttribute('data-testid') === 'user-message') {
    return { role: 'user', text: (el.textContent || '').trim() };
  }
  // Assistant: pull from .font-claude-response child (markdown rendering)
  const body = el.querySelector('.font-claude-response') || el;
  return {
    role: 'assistant',
    text: (body.textContent || '').trim(),
    streaming: el.getAttribute('data-is-streaming') === 'true' || undefined
  };
});
return {
  title: document.title.replace(/^Claude\s*[-—|:]\s*/, '').replace(/\s*-\s*Claude$/, '').trim() || document.title,
  url: location.href,
  messages
};
