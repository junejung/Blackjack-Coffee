###
  This is how you define a class in coffeescript. Internally it does what
  Backbone.View.extend does.

  You need to explicitly define your class as a property of the global window
  object, because coffeescript is always executed in an anonymous function scope 
  instead of the global scope. 
  
  You can still normally access the class as BlackjackView everywhere, though.
###
class window.BlackjackView extends Backbone.View

  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"

  ###
    In the constructor you'll want to define the variables that contain the
    state of the game. Some examples that could be useful are already in there.

    Remember, in coffeescript you use an @ instead of this.
  ###

  initialize: ->
    console.log("BJ view has been initialized")
    # this is how you call a member function
    @reset()
    #@colloction.hands.player/dealer : collection of hands
      
  ###
    This function is meant to reset the game state whenever a new round starts.
  
    You'll probably want to set some instance properties, render 
  ###

  reset: ->
    @collection.createStack()
    @subviews = _.map(@collection.hands, (hand)->
      new HandView({collection: hand})
    )
    @render()
    console.log "game starting"

  render: ->
    $('.dealer-cards').append(@subviews[0].render())
    $('.player-cards').append(@subviews[1].render())

    return @$el

  ###
    Give the player another card. If the player has more than 21, they lose. If they have
    21 points exactly, they win and if they have fewer than 21 points they can decide
    to hit or stand again.
  ###
  hit: =>
    @subviews[1].collection.add(@collection.dealCard(), {remove: false})
    console.log("player got one more card!")
    console.log(@subviews)

  ###
    Reveal the dealer's face down card. Give the dealer cards until they have 17
    points or more. If the dealer has over 21 points or the player has more points
    than the dealer (but fewer than 21), the player wins. 
  ###
  stand: ->
    #dealer action.
    #score the dealer's hand
    console.log "TODO implement stand"

