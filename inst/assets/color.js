var color = new Shiny.InputBinding();

$.extend(color, {
  find: function(scope) {
    return $(scope).find(".bsutils-color");
  },
  getValue: function(el) {
    return $(el).val();
  },
  setValue: function(el, value) {
    $(el).val(value);
    $(el).change();
  },
  receiveMessage: function(el, value){
    this.setValue(el, value);
  },
  subscribe: function (el, callback) {
    $(el).on("change.bsutils-color", function(){
      callback(true);
    })
  },
  unsubscribe: function(el) {
    $(el).off(".bsutils-color");
  }
});

Shiny.inputBindings.register(color, 'bsutils.color');
