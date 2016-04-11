class Raffler.Routers.Entries extends Backbone.Router

  routes:
    '':'index'
    'entries/:id':'show'

  # events:
  #   'click #show_model': 'show'

  initialize: ->


  index: ->
    view = new Raffler.Views.EntriesIndex(collection: Raffler.collection)
    $("#container").html(view.render().el)

  show: (id) ->
    console.log "id is", id
    model = Raffler.collection.get(id)
    console.log "model is ", model.toJSON()
    show = new Raffler.Views.EntriesShow({
      model: model
    })
    $("#container").html(show.render().el)

  # edit: ->
  #   edit = new Raffler.Views.EntriesEdit(collection: @collection)