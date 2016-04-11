class Raffler.Routers.Entries extends Backbone.Router

  routes:
    '':'index'
    'entries/:id':'edit'
    'dashboard': 'dashboard'

  initialize: ->
    @collection = new Raffler.Collections.Entries()
    _this = @
    @collection.fetch({
      success: ->
        models = _this.collection.models
        _this.collection.reset(models)
    })

  index: ->
    console.log "now at index"
    view = new Raffler.Views.EntriesIndex(collection: @collection)
    $("#container").html(view.render().el)

  edit: ->
    edit = new Raffler.Views.EntriesEdit(collection: @collection)

  dashboard: ->
    $("#container").html("<h1> Welcome to Dashboard </h1>");