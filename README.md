# Screenrocket

A client library to use our screenshotting service

## Installation

Using Bower:

    bower install screenrocket

Or grab the [source](https://github.com/visup/screenrocket/dist/screenrocket.js) ([minified](https://github.com/visup/screenrocket/dist/screenrocket.min.js)).

## Usage

Basic usage is as follows:

```javascript
var screenrocket = new Screenrocket({ apiKey: 'YOUR_API_KEY' });

screenrocket.render(options).done(function(data) {
  $('document').append('<img src="' + data.url + '">')
});
```

### Options

| Option         | Default                | Description                                                                                                                                   |
|----------------|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| url            | `window.location.href` | The url to be screenshotted                                                                                                                   |
| startX         | 0                      | The x coordinates to start the screenshot from                                                                                                |
| startY         | 0                      | The y coordinates to start the screenshot from                                                                                                |
| width          | 1280                   | The width of the screenshot                                                                                                                   |
| height         | 720                    | The height of the screenshot                                                                                                                  |
| viewportWidth  | 1280                   | The browser window width when screenshotting                                                                                                  |
| viewportHeight | 720                    | The browser window height when screenshotting                                                                                                 |
| element        | _undefined_            | The selector of the element to be screenshotted (overrides start*/width/height values), only first element that matches will be screenshotted |

## Contributing

We'll check out your contribution if you:

* Provide a comprehensive suite of tests for your fork.
* Have a clear and documented rationale for your changes.
* Package these up in a pull request.

We'll do our best to help you out with any contribution issues you may have.

## License

MIT. See `LICENSE.txt` in this directory.
