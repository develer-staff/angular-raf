angular.module 'angular-raf', []
    .factory 'raf', ['$rootScope', ($rootScope) ->
        apply: (f) ->
            window.requestAnimationFrame () ->
                $rootScope.$apply f

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
    ]