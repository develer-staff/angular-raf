angular.module 'angular-raf', []
    .service 'raf', class AngularRaf
        constructor: ->
            console.assert window.requestAnimationFrame, "Your user agent doesn't provide a suitable implementation of requestAnimationFrame() !"
            console.assert window.cancelAnimationFrame, "Your user agent doesn't provide a suitable implementation of cancelAnimationFrame() !"

        onRenderFrame: (scope, cb) ->
            requestId = undefined

            render = ->
                do cb

                requestId = window.requestAnimationFrame render

            disconnect = scope.$on '$locationChangeStart', ->
                if requestId
                    window.cancelAnimationFrame requestId

                do disconnect

            do render
