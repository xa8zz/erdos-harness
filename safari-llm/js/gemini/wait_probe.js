const resps = [...document.querySelectorAll('response-container .markdown-main-panel')];
const last = resps[resps.length - 1];
const text = last ? (last.textContent || '') : '';
// Gemini leaves `.pending` class + "Stop response" button in the DOM even after
// streaming completes — neither is a reliable signal. Rely purely on text-length
// stability (handled by the Python polling loop).
return {
  streaming: false,
  len: text.length,
  bodyLen: document.body.innerText.length,
  hidden: document.hidden
};
