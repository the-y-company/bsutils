Shiny.addCustomMessageHandler('bsutils-modal', (msg) => {
  var modal = new bootstrap.Modal(document.getElementById(msg.id), {})

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
