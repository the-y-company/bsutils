Shiny.addCustomMessageHandler('bsutils-modal', (msg) => {
  var modal = bootstrap.Modal.getOrCreateInstance(
    document.getElementById(msg.id),
    {},
  );

  if(msg.action == 'show'){
    modal.show();
    return;
  }

  if(msg.action == 'hide'){
    modal.hide();
    return;
  }
  
  modal.toggle();
});