var fs = require('fs');
var path = require('path');

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    mochaTest: {
      options: {
        timeout: 3000,
        ignoreLeaks: false,
        reporter: 'spec'
      },
      src: ['test/*_test.js']
    },
    jshint: {
      options: {
        jshintrc: true
      },
      src: ['lib/*.js', 'test/*.js']
    },
    ti_run: {
      app: {
        files: {
          'tmp/app/Resources': ['ti-mocha.js', 'test/app.js']
        }
      }
    },
    clean: {
      src: ['build', 'tmp']
    }
  });

  // Load grunt plugins for modules
  grunt.loadNpmTasks('grunt-mocha-test');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-titanium');

  // lint and test node and titanium
  grunt.registerTask('test', ['clean', 'mochaTest']);
  grunt.registerTask('default', ['clean', 'jshint', 'mochaTest', '_build', 'clean', 'ti_run']);

};
