window.Raffler =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	@collection = new Raffler.Collections.Entries()
  	_this = @
  	@collection.fetch({
  		success: ->
  			_this.router = new Raffler.Routers.Entries()
		  	Backbone.history.start()
		})
  	

$(document).ready ->
  Raffler.initialize()
