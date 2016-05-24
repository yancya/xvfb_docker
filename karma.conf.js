// karma.conf.js

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['mocha'],
    files: ['test/**/*.js'],
    exclude: [],
    preprocessors: {},
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: false,
    customLaunchers: {
      ChromeNoSandbox: {
        base: 'Chrome',
        flags: ["--no-sandbox"]
      }
    },
    browsers: ['ChromeNoSandbox', 'Firefox'],
    singleRun: false
  });
};
