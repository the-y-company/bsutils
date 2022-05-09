var range = new Shiny.InputBinding();

$.extend(range, {
  find: function(scope) {
    return $(scope).find(".bsutils-range");
  },
  getValue: function(el) {
    return parseInt($(el).val());
  },
  setValue: function(el, value) {
    $(el).val(value);
    $(el).change();
  },
  receiveMessage: function(el, msg){
    if(msg.value)
      this.setValue(el, msg.value);

    if(msg.min)
      $(el).attr('min', msg.min);

    if(msg.max)
      $(el).attr('max', msg.max);
  },
  subscribe: function (el, callback) {
    $(el).on("change.bsutils-range", function(){
      callback(true);
    })
  },
  unsubscribe: function(el) {
    $(el).off(".bsutils-range");
  }
});

Shiny.inputBindings.register(range, 'bsutils.range');

