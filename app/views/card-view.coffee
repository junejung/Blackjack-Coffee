class window.CardView extends Backbone.View

  tagName: "table"

  className: "card"

  initialize: ->
    console.log("Card view has been initialized")

  render: ->
    @$el.append("<tr><td> #{@model.suit} </td><td> #{@model.number} </td></tr>")
    return @$el