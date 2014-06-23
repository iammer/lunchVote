#!/usr/bin/env coffee

_= require 'underscore'
coffeescript= require 'connect-coffee-script'
connectless= require 'connect-less'
morgan= require 'morgan'
express= require 'express'

database= require './src/database'
routeLoader= require './src/routeLoader'

db=new database.DB (err) ->
	if (err)
		console.log "Error loading DB #{err}"
	else
		console.log "DB Loaded"

app= express()

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use morgan()

app.use coffeescript
	src: __dirname + '/src/client/coffee'
	dest: __dirname + '/generated/public/coffee'
	prefix: '/coffee/'

app.use connectless
	src: __dirname + '/src/client/less'
	dst: __dirname + '/generated/public/less'
	dstRoot: __dirname + '/generated/public'
	debug: true

app.use routeLoader __dirname + '/src/routes',
	app: app
	db: db

app.use express.static __dirname + '/public'
app.use express.static __dirname + '/generated/public'
app.use express.static __dirname + '/bower'

app.get '/', (req, res) ->
	res.redirect '/vote'

app.listen 8080

console.log 'Started...'
