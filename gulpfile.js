var gulp = require('gulp')
var sass = require('gulp-sass')

// Compile sass into CSS
gulp.task('sass', function () {
  return gulp.src([
    'frontend/src/scss/*.scss'
  ]).pipe(sass())
    .pipe(gulp.dest('frontend/dist/css'))
})

gulp.task('html', function () {
  return gulp.src([
    'frontend/src/*.html'
  ]).pipe(gulp.dest('frontend/dist'))
})

gulp.task('default', gulp.parallel(['sass', 'html']))
