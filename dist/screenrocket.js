(function(root, undefined) {

  "use strict";


var Screenrocket;

Screenrocket = (function() {
  var defaults;

  defaults = {
    apiKey: null,
    endpoint: 'http://screenshotter-lambda.herokuapp.com/screenshots/create'
  };

  function Screenrocket(options) {
    if (options == null) {
      options = {};
    }
    this.options = $.extend({}, defaults, options);
    if (!this.options.apiKey) {
      throw '[screenrocket] Please provide an API key when initializing';
    }
  }

  Screenrocket.prototype.render = function(options) {
    if (options == null) {
      options = {};
    }
    return $.ajax({
      url: this.options.endpoint,
      method: 'POST',
      data: $.extend({
        apiKey: this.options.apiKey,
        url: window.location.href,
        returnUrl: true
      }, options),
      dataFilter: function(data) {
        return JSON.stringify(JSON.parse(data).result);
      }
    });
  };

  return Screenrocket;

})();

Screenrocket.VERSION = '0.0.2';

root.Screenrocket = Screenrocket;


}(this));
