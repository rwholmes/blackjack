class window.CardView extends Backbone.View

  className: 'card'

  template: _.template ''

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.attr 'id', @model.attributes.rankName+@model.attributes.suitName
    @$el.addClass 'covered' unless @model.get 'revealed'
