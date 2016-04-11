class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'
    'click #delete_name': 'deleteEntry'
    'click .show_model': 'show'


  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntries, @)
    @

  deleteEntry: (event) ->
    model_id = $(event.currentTarget).attr('data-model-id')
    model = @collection.get(model_id)
    model.destroy()
    @render()
    # event.preventDefault()
    # @model.destroy()

  appendEntries: (model) ->
  	child_view = new Raffler.Views.Entry({ model: model })
  	# console.log child_view.render().el
  	$(@el).find("#entries").append(child_view.render().el)
  	# console.log "from append", model.toJSON()

  createEntry: (event) ->
    event.preventDefault()
    @collection.create name: $('#new_entry_name').val(), mobile_number: $('#new_entry_mobile').val()

  show: (e) ->
    model_id = $(e.currentTarget).attr('data-model-id')
    Raffler.router.navigate('entries/' + model_id, {trigger: true})
