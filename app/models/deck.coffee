class window.Deck extends Backbone.Collection

  hands: {}
  
  suits: ['Spades','Diamonds','Clubs','Hearts']

  initialize: ->

  createStack: ->
    @models = []
    for suit in @suits
      for i in [1..13]
        @models.push(new window.Card(suit,i))
    @models = _.shuffle(@models)
    @dealHand()
    console.log(@models)

  dealCard: ->
    @models.pop()

  #set up a game
  dealHand: ->
    p1 = @dealCard()
    p2 = @dealCard()
    d1 = @dealCard()
    d2 = @dealCard()
    @hands.player = new Hand([p1, p2])
    @hands.dealer = new Hand([d1, d2])
