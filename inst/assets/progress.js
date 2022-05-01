var progress = new Shiny.InputBinding();

$.extend(progress, {
  find: function(scope) {
    return $(scope).find(".bsutils-progress");
  },
  getValue: function(el) {
    return $(el).attr("aria-valuenow");
  },
  setValue: function(el, value) {
    let max = $(el).attr("aria-valuemax");
    let val = Math.ceil((value / max) * 100);
    $(el).css('width', `${val}%`);
    $(el).attr("aria-valuenow", value).change();
  },
  receiveMessage: function(el, value){
    this.setValue(el, value);
  },
  subscribe: function (el, callback) {
    $(el).on("change.bsutils-progress", function(){
      callback(true);
    })
  },
  unsubscribe: function(el) {
    $(el).off(".bsutils-progress");
  }
});

Shiny.inputBindings.register(progress, 'bsutils.progress');
