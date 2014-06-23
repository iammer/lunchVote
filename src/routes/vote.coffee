express= require 'express'

module.exports= (ctx) ->
		router= express.Router()
		router.get '/', (req,res) ->
			ctx.db.getPlaces (err,places) ->
				res.render 'vote', ballot: places
