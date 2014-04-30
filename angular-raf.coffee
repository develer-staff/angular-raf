angular.module 'angular-raf', []
    .service 'raf', class AngularRaf
        constructor: ->
            @requestAnimationFrame = window.requestAnimationFrame or
                window.webkitRequestAnimationFrame or
                window.mozRequestAnimationFrame or
                window.msRequestAnimationFrame

            console.assert @requestAnimationFrame, "Your user agent doesn't provide a suitable implementation of requestAnimationFrame() !"

            @cancelAnimationFrame = window.cancelAnimationFrame or
                window.webkitCancelAnimationFrame or
                window.mozCancelAnimationFrame

            console.assert @cancelAnimationFrame, "Your user agent doesn't provide a suitable implementation of cancelAnimationFrame() !"

        onRenderFrame: (scope, cb) ->
            requestId = undefined

            render = ->
                do cb

                requestId = @requestAnimationFrame render

            disconnect = scope.$on '$locationChangeStart', ->
                @cancelAnimationFrame requestId if requestId

                do disconnect

            do render
