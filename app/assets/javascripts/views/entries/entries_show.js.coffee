class Raffler.Views.EntriesShow extends Backbone.View
  template: JST['entries/show']
  
  events: ->
    'click #back_to_home': 'back'

  render: ->
    $(@el).html(@template({ contact: @model.toJSON() }))
    @

  back: (e) ->
    Raffler.router.navigate('', {trigger: true})
