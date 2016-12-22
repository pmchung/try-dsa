var gulp = require('gulp');
var mocha = require('gulp-mocha');
var coffee = require('coffee-script/register');

gulp.task('default', function() {
  gulp.src('./test', { read: false })
    .pipe(mocha({ 
      reporter: 'spec',
      compilers: { js: coffee }
     }));
});