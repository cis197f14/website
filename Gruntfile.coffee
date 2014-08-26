module.exports = (grunt) ->

  matchDep = require('matchdep')
  matchDep.filterDev('grunt-*').forEach grunt.loadNpmTasks

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    jade:
      compile:
        options:
          pretty: true
      glob_to_multiple:
        options:
          pretty: true
        expand: true
        cwd: 'src/templates/'
        src: ['*.jade']
        dest: 'app/'
        ext: '.html'

    # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    coffee:
      glob_to_multiple:
        expand: true
        cwd: 'src/coffeescripts/'
        src: ['*.coffee']
        dest: 'app/assets/javascripts/'
        ext: '.js'

    requirejs:
      compile:
        options:
          name: 'main'
          optimize: 'uglify'
          baseUrl: 'app/assets/javascripts'
          mainConfigFile: 'app/assets/javascripts/config.js'
          include: 'requireLib'
          out: 'app/build/javascripts/main-optimized.min.js'

    # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    cssc:
      build:
        options:
          consolidateViaDeclarations: true
          consolidateViaSelectors: true
          consolidateMediaQueries: true

    cssmin:
      build:
        src: 'app/assets/css/main.css'
        dest: 'app/build/css/main.css'

    sass:
      glob_to_multiple:
        expand: true
        cwd: 'src/scss/'
        src: ['*.scss']
        dest: 'app/assets/css/'
        ext: '.css'

    # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    watch:
      templates:
        files: ['src/templates/**/*.jade']
        tasks: ['jade']

      coffee:
        files: ['src/coffeescripts/*.coffee']
        tasks: ['buildjs']

      css:
        files: ['src/scss/**/*.scss', 'app/assets/css/font.css']
        tasks: ['buildcss']

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'buildjs', ['coffee', 'requirejs']
  grunt.registerTask 'buildcss', ['sass', 'cssc', 'cssmin']

