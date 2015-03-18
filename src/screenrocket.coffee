class Screenrocket
  defaults = apiKey: null, endpoint: 'http://screenshotter-lambda.herokuapp.com/screenshots/create'
  constructor: (options = {}) ->
    @options = $.extend {}, defaults, options
    throw '[screenrocket] Please provide an API key when initializing' unless @options.apiKey
  render: (options = {}) ->
    $.ajax
      url: @options.endpoint
      method: 'POST'
      data: $.extend { apiKey: @options.apiKey, url: window.location.href, returnUrl: true }, options
      dataFilter: (data) ->
        JSON.stringify(JSON.parse(data).result)

# Version.
Screenrocket.VERSION = '0.0.2'
# Export to the root, which is probably `window`.
root.Screenrocket = Screenrocket
