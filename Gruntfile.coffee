'use strict'
path = require('path')
lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet

folderMount = (connect, point) ->
	return connect.static(path.resolve(point))


module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		# uglify:
		# 	options:
		# 		mangle: false
		# 		preserveComments: 'some'
		# 		banner: '/*! <%= pkg.name %> - v<%= pkg.version %>  */'
		# 	compile:
		# 		files:
		# 			'js/script.min.js' : [
		# 				#'src/js/plugins/jrespond.js', 
		# 				'src/js/bootstrap/bootstrap-dropdown.js', 
		# 				'src/js/plugins/plugins.js',
		# 				'src/js/script.js']
		# 			'js/script-touch.min.js' : [
		# 				#'src/js/plugins/fastclick.js', 
		# 				#'src/js/plugins/jrespond.js', 
		# 				'src/js/plugins/touchswipe.js', 
		# 				'src/js/bootstrap/bootstrap-dropdown.js', 
		# 				'src/js/plugins/plugins.js',
		# 				'src/js/script.js',
		# 				'src/js/touch.js']
		# 			'js/slider.min.js' : [
		# 				'src/js/plugins/anythingslider.js'
		# 				#'src/js/plugins/jquery.flexslider-min.js', 
		# 				#'src/js/plugins/bjqs.min.js',
		# 				'src/js/slider-update.js']
		# 	compile_no_uglify:
		# 		options:
		# 			compress: false
		# 			mangle: false
		# 			preserveComments: 'all'
		# 			beautify: true
		# 			banner: ''
		# 		files:
		# 			'js/init.js' : 'src/js/init.js'
		# 			'js/modernizr.js' : [
		# 				'src/js/plugins/modernizr.js', 
		# 				'src/js/plugins/modernizr-boxsizing.js']

		# jshint:
		# 	options:
		# 		"camelcase" : false
		# 		"es3" : false
		# 		"trailing" : false
		# 		"white" : false
		# 		"smarttabs" : true
		# 		"jquery" : true
		# 		"browser" : true
		# 	files:[
		# 		'src/js/fonts.js', 
		# 		'src/js/init.js', 
		# 		'src/js/script.js', 
		# 		'src/js/slider-update.js', 
		# 		'src/js/touch.js'
		# 	]


		sass:
			options:
				style: 'compressed'
				compass: 'config.rb'
				#debugInfo: true
				trace: true
				loadPath: ['sass/','sass/shared/']
				sourcemap: true
			compile:
				files:[
					expand: true
					cwd: 'sass/'
					src: ['*.scss', '*.sass']
					dest: 'css/'
					ext: '.css'
				]

		less:
			options:
				paths: ['less/']
			src:
				expand: true
				cwd: 'less/'
				src: ['style.less']
				dest: 'css/'
				ext: '.css'

		# autoprefixer:
		# 	compile:
		# 		files:[
		# 			expand: true
		# 			cwd: 'css/'
		# 			src: '*.css'
		# 			dest: 'css/'
		# 			ext: '.css'
		# 		]

		jade:
			options:
				pretty: true
			compile:
				base_path:
				    files:
				      'dest/path/': ['jade/*.jade']
				files:[
					expand: true
					cwd: 'jade/'
					src: ['**/*.html.jade']
					basePath: ''
					dest: ''
					ext: '.html'
				]
		connect:
			livereload:
				options:
					hostname: '0.0.0.0'
					port: 9001
					middleware: (connect, options) ->
						return [lrSnippet, folderMount(connect, '.')]
		regarde:
			#uglify:
				# files: ['js/**/*.js']
				# tasks: ['jshint', 'uglify', 'livereload']
			less:
				files: ['less/**/*.less']
				tasks: ['less', 'livereload']
			jade:
				files: ['jade/**/*.jade']
				tasks: ['jade', 'livereload']
			image:
				files: ['img/*']
				tasks: ['livereload']

	# grunt.loadNpmTasks('grunt-contrib-coffee')
	grunt.loadNpmTasks('grunt-contrib-uglify')
	grunt.loadNpmTasks('grunt-contrib-sass')
	grunt.loadNpmTasks('grunt-contrib-less')
	#grunt.loadNpmTasks('grunt-autoprefixer')
	grunt.loadNpmTasks('grunt-contrib-jade')
	grunt.loadNpmTasks('grunt-regarde')
	grunt.loadNpmTasks('grunt-contrib-connect')
	grunt.loadNpmTasks('grunt-contrib-livereload')
	grunt.loadNpmTasks('grunt-contrib-jshint');

	# Default task(s).
	grunt.registerTask('compile', ['less', 'jade'])
	grunt.registerTask('default', ['compile', 'livereload-start', 'connect', 'regarde'])