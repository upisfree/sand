// TODO: CoffeeScript
//       client and server in one task
var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    livereload = require('gulp-livereload');

var path =
{
  build: './build/',
  src:
  {
    client: './src/client/',
    server: './src/server/'
  }
}

gulp.task('client', function()
{
  return gulp.src([path.src.client + 'globals.coffee',
                   path.src.client + '*/*.coffee',
                   path.src.client + 'start.coffee'])
             .pipe(coffee({ bare: true }).on('error', gutil.log))
             .pipe(concat('client.dev.js'))
             .pipe(gulp.dest(path.build))
             .pipe(livereload());
});

gulp.task('server', function()
{
  return gulp.src([path.src.server + 'globals.coffee',
                   path.src.server + '*/*.coffee',
                   path.src.server + 'start.coffee'])
             .pipe(coffee({ bare: true }).on('error', gutil.log))
             .pipe(concat('server.dev.js'))
             .pipe(gulp.dest(path.build));
});

gulp.task('build-client', function()
{
  return gulp.src([path.src.client + 'globals.coffee',
                   path.src.client + '*/*.coffee',
                   path.src.client + 'start.coffee'])
             .pipe(coffee({ bare: true }).on('error', gutil.log))
             .pipe(concat('client.js'))
             .pipe(uglify())
             .pipe(gulp.dest(path.build));
});

gulp.task('build-server', function()
{
  return gulp.src([path.src.server + 'globals.coffee',
                   path.src.server + '*/*.coffee',
                   path.src.server + 'start.coffee'])
             .pipe(coffee({ bare: true }).on('error', gutil.log))
             .pipe(concat('server.js'))
             .pipe(uglify())
             .pipe(gulp.dest(path.build));
});

gulp.task('build', function()
{
  gulp.run('build-client', 'build-server');
});

gulp.task('default', function()
{
  gulp.run('client', 'server');

  livereload.listen();

  gulp.watch(path.src.client + '**/*.coffee', function()
  {
    gulp.run('client');
  });

  gulp.watch(path.src.server + '**/*.coffee', function()
  {
    gulp.run('server');
  });
});