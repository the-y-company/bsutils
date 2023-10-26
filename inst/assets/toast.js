Shiny.addCustomMessageHandler("bsutils-toast", (msg) => {
  let el = document.getElementById(msg.id);
  let toast = bootstrap.Toast.getOrCreateInstance(el, msg.opts);

  if (msg.body) {
    $(el).find(".toast-body").html(msg.body);
  }

  if (msg.header) {
    $(el).find(".toast-header").html(msg.header);
  }

  if (msg.action == "show") {
    toast.show();
    return;
  }

  toast.hide();
});
