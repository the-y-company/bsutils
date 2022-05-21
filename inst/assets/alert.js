import 'shiny';

$(function() {
  Shiny.addCustomMessageHandler('alert-show', (msg) => {
    $(`#${msg}`).show();
  });

  Shiny.addCustomMessageHandler('alert-hide', (msg) => {
    $(`#${msg}`).hide();
  });
});