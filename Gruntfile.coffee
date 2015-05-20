module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  require('time-grunt')(grunt)

  config =
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      dev:
        options:
          join: true
        files:
          'build/<%= pkg.name %>.dev.js': [
            'src/globals.coffee'
            'src/**/*.coffee'
            'src/start.coffee'
          ]
      release: # you don't see it
        options:
          join: true
        files:
          'build/<%= pkg.name %>.js': [
            'src/**/*'
            'src/start.coffee'
          ]

    uglify:
      release:
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.js'

    connect:
      watch:
        options:
          port: 8000
          open: 'http://localhost:8000/dev.html'
          livereload: 8001

    watch:
      options:
        livereload:
          port: 8001
      src:
        files: ['src/**/*.coffee']
        tasks: ['coffee:dev']
      gruntfile:
        files: 'Gruntfile.coffee'
        options:
          reload: true

  grunt.registerTask 'dev', ['coffee:dev', 'connect:watch', 'watch']

  grunt.initConfig config