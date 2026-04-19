const assistants = [...document.querySelectorAll('[data-is-streaming]')];
const last = assistants[assistants.length - 1];
const text = last ? (last.querySelector('.font-claude-response') || last).textContent : '';
return {
  streaming: !!document.querySelector('[data-is-streaming="true"]'),
  len: text.length,
  bodyLen: document.body.innerText.length,
  hidden: document.hidden
};
