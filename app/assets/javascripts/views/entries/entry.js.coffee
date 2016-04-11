class Raffler.Views.Entry extends Backbone.View
	template: JST['entries/entry']
	tagName: 'tr'

	events:
    'click #edit_name': 'editEntry'
    'click #update': 'updateEntry'
	
	render: ->
		$(@el).html(@template({entry: @model.toJSON()}))
		@


	editEntry: (event) ->
		$(@el).find("#label-name").html("<input id='model-name' type='text' value='" + @model.get('name') + "'>")
		$(@el).find("#label-mobile").html("<input id='model-mobile' type='text' maxLength='10' value='" + @model.get('mobile_number') + "'>")
		$(@el).find("#edit_name").attr("id", "update").html("Update")
		# edit = new Raffler.Views.EntriesEdit({model: @model})
		# $("#container").append(edit.render().el)
		# console.log(edit)

	updateEntry: (e) ->
		name = $(@el).find("#model-name").val()
		mobile = $(@el).find("#model-mobile").val()
		# console.log mobile
		@model.set({ name: name, mobile_number: mobile })
		# console.log @model.toJSON()
		@model.save()
		# console.log @model.toJSON()
		@render()