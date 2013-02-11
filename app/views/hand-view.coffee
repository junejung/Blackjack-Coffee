class window.HandView extends Backbone.View

  tagName: "div"

  className: "cards"

  initialize: =>
    console.log("Hand view has been initialized")
    @subviews = _.map(@collection.cardsInHand, (card) =>
      new CardView({model: card})
    )
    #@$el.append(@render())
    console.log(@subviews)

  render: ->
    _.each(@subviews, (subview) =>
      @$el.append(subview.render())
    )
    return @$el
