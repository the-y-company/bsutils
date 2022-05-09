var textGroup = new Shiny.InputBinding();

$.extend(textGroup, {
  find: function(scope) {
    return $(scope).find(".bsutils-text-group");
  },
  getValue: function(el) {
    return $(el).val();
  },
  setValue: function(el, value) {
    $(el).val(value);
  },
  receiveMessage: function(el, msg){
    if(msg.value)
      this.setValue(el, msg.value);

    if(msg.label)
      $(el).siblings('span').text(msg.label);
  },
  subscribe: function (el, callback) {
    $(el).on("keyup.bsutils-text-group input.bsutils-text-group", function(){
      callback(true);
    });

    $(el).on("change.bsutils-text-group", function(){
      callback(false);
    });
  },
  unsubscribe: function(el) {
    $(el).off(".bsutils-text-group");
  },
  getRatePolicy: function(){
    return {
      policy: 'debounce',
      delay: 250
    }
  } 
});

Shiny.inputBindings.register(textGroup, 'bsutils.bsutils-text-group');


