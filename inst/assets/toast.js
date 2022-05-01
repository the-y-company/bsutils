Shiny.addCustomMessageHandler('bsutils-toast', (msg) => {
  let el = document.getElementById(msg.id);
  let toast = bootstrap.Toast.getOrCreateInstance(el, msg.opts);

  if(msg.action == "show") {
    toast.show();
    return;
  }

  toast.hide();
});
