Datasource= require 'nedb'
async= require 'async'

datasources= ['places','votes','ballots']

class DB
	constructor: (final) ->
		self=this

		async.map datasources, (dsName, cb) ->
			ds=new Datasource
				filename: "db/#{dsName}.nedb"

			ds.loadDatabase (err) ->
				if err
					cb err
				else
					cb null, ds
			
			self[dsName]=ds
		, (err) ->
			final err if err
			self.places.count {}, (err,count) ->
				if count==0
					places=[
						'Subway',
						'House of Japan',
						'Royal Ginger',
						'Quaker State',
						'Penn Station',
						'Jimmy Johns',
						'Claudiana\'s'
					]

					async.map places, (name, cb) ->
						self.places.insert name: name, cb
					, final
				else
					final() if final

	getPlaces: (cb) -> @places.find({},cb)

module.exports = DB: DB
