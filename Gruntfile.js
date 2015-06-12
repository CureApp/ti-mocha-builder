
module.exports = function(grunt) {


  require('time-grunt')(grunt);
  require('jit-grunt')(grunt);


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

  // lint and test node and titanium
  grunt.registerTask('test', ['clean', 'mochaTest']);
  grunt.registerTask('default', ['clean', 'jshint', 'mochaTest', 'clean', 'ti_run']);

};
