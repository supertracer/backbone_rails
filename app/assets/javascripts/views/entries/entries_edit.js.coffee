class Raffler.Views.EntriesEdit extends Backbone.View

  template: JST['entries/edit']

  render: ->
  	$(@el).html(@template({edit_entry: @model.toJSON()}))
		@