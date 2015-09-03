var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    livereload = require('gulp-livereload'),
    coffeeify = require('gulp-coffeeify'),
    rename = require('gulp-rename');

var path =
{
  build: './build/',
  src:
  {
    client: './src/client/',
    server: './src/server/'
  }
}

gulp.task('dev-client', function()
{
  return gulp.src(path.src.client + 'index.coffee')
             .pipe(coffeeify())
             // .pipe(uglify())
             .pipe(rename('client.dev.js'))
             .pipe(gulp.dest(path.build));
});

gulp.task('dev', function()
{
  gulp.watch(path.src.client + '**/*.coffee', function()
  {
    gulp.run('dev-client');
  });
});