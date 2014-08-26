require.config
  paths:
    jquery:     '../../build/javascripts/vendor/jquery-2.1.0.min'
    underscore: '../../build/javascripts/vendor/lodash.underscore.min'
    moment:     '../../build/javascripts/vendor/moment.min'
    requireLib: '../../build/javascripts/vendor/require.min'
  shim:
    underscore:
      deps: []
      exports: '_'

