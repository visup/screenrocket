module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        options:
          bare: true
        files:
          'tmp/screenrocket.js': 'src/screenrocket.coffee'
    concat:
      options: separator: '\n\n'
      dist:
        src: [
          'src/_intro.js'
          'tmp/screenrocket.js'
          'src/_outro.js'
        ]
        dest: 'dist/<%= pkg.name.replace(".js", "") %>.js'
    uglify:
      options: banner: '/*! <%= pkg.name.replace(".js", "") %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      dist: files: 'dist/<%= pkg.name.replace(".js", "") %>.min.js': [ '<%= concat.dist.dest %>' ]
    qunit: files: [ 'test/*.html' ]
    jshint:
      files: [ 'dist/screenrocket.js' ]
      options:
        globals:
          console: true
          module: true
          document: true
        jshintrc: '.jshintrc'
    watch:
      options:
        livereload: true
      files: [ 'src/*', 'demo/*' ]
      tasks: [
        'coffee'
        'bowercopy'
        'concat'
      ]
    bowercopy:
      vendor:
        options:
          destPrefix: 'vendor'
        files:
          'jquery.js': 'jquery/dist/jquery.js'
    connect:
      options:
        port: 9000
        livereload: 35729
        hostname: 'localhost'
      livereload:
        options:
          open: true

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-qunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-bowercopy'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'serve', [
    'bowercopy'
    'coffee'
    'concat'
    'connect:livereload'
    'watch'
  ]

  grunt.registerTask 'test', [
    'bowercopy'
    'coffee'
    'concat'
    'jshint'
    'qunit'
  ]

  grunt.registerTask 'default', [
    'bowercopy'
    'coffee'
    'concat'
    'jshint'
    'qunit'
    'uglify'
  ]
  return
