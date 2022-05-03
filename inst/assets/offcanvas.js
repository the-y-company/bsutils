Shiny.addCustomMessageHandler('bsutils-offcanvas', (msg) => {
  let el = document.getElementById(msg.id);
  let canvas = bootstrap.Offcanvas.getOrCreateInstance(el, msg.opts);
  
  if(msg.action == "show") {
    canvas.show();
    return;
  }

  if(msg.action == "hide") {
    canvas.hide();
    return;
  }

  canvas.toggle();
});
