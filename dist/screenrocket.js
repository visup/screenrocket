(function(root, undefined) {

  "use strict";


var Screenrocket, Screenshotter;

Screenshotter = (function() {
  var defaults;

  defaults = {
    apiKey: null,
    endpoint: 'http://screenshotter-lambda.herokuapp.com/screenshots/create'
  };

  function Screenshotter(options) {
    if (options == null) {
      options = {};
    }
    this.options = $.extend({}, defaults, options);
    if (!this.options.apiKey) {
      throw '[screenrocket] Please provide an API key when initializing';
    }
  }

  Screenshotter.prototype.render = function(options) {
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

  return Screenshotter;

})();

Screenrocket = function(options) {
  return new Screenshotter(options);
};

Screenrocket.VERSION = '0.0.1';

root.Screenrocket = Screenrocket;


}(this));
