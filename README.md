angular-raf
===========

![RAF](raf.png)

Provides some useful wrappers around `requestAnimationFrame()` and `cancelAnimationFrame()`
integrated with Angular.JS view life-cycle.

Supported browsers:

- Chrome 31+
- Firefox 26+
- Internet Explorer 10+
- Safari 7+

Basically, any browser exposing `requestAnimationFrame()` and `cancelAnimationFrame()`.


## Installation

This library is provided as a Bower component and NPM module:

- Bower: `bower install angular-raf`
- NPM: `npm install angular-raf`


## How to use

Add `angular-raf` to the list of dependencies in your Angular.JS application:

```javascript
angular.module('myapp', [
    'ngRoute',
    // ...
    'angular-raf'
]);
```


## Available helpers

### apply

`apply` schedules a `$rootScope.$apply` to run during the next frame, leveraging
`window.requestAnimationFrame`.

```javascript
angular.module('myapp').controller('MyController', function ($scope, raf) {
    raf.apply(function() {
        // Update scope variables.
    });
});
```


### onRenderFrame

`onRenderFrame` wraps `requestAnimationFrame()` and takes a callback as first argument, calling it
continuously whenever the browser has to render another frame, stopping only when the user is
browsing away from your controller.

```javascript
angular.module('myapp').controller('MyController', function ($scope, raf) {
    raf.onRenderFrame($scope, function() {
        // Perform jQuery-style DOM manipulation or update Scope variables here.
    });
});
```
