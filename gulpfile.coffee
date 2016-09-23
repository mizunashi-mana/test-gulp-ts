gulp = require 'gulp'
ts = require 'gulp-typescript'

merge = require 'merge2'

tsProject = ts.createProject 'tsconfig.json',
  typescript: require 'typescript'

gulp.task 'build', ->
  tsResult = gulp.src [
      'src/index.ts'
      'src/bin/app.ts'
      'src/illegal.ts'
  ]
    .pipe tsProject ts.reporter.defaultReporter()

  merge [
    tsResult.js
    tsResult.dts
  ]
    .pipe gulp.dest 'dist'

gulp.task 'build:correct', ->
  tsResult = gulp.src [
      'src/index.ts'
      'src/bin/app.ts'
      'src/illegal-but-correctgts.ts'
  ]
    .pipe tsProject ts.reporter.defaultReporter()
 
  merge [
    tsResult.js
    tsResult.dts
  ]
    .pipe gulp.dest 'dist'
