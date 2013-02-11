describe "Card", ->

  newCard = null

  beforeEach ->
    newCard = new Card('A',3)

  it "should have property named suit", ->
    expect(newCard.suit).toEqual(jasmine.any(String))

  it "should have property named number", ->
    expect(newCard.number).toEqual(jasmine.any(Number))
 
describe "Deck", ->

  deck = null

  beforeEach ->
    deck = new Deck()

  it "should have property named stack", ->
    expect(deck.stack).toEqual(jasmine.any(Array))

  it "should fill stack with 52 models", ->
    expect(deck.stack.length).toBe(52-4)

  it "should create dealer and player property on hands object", ->
    expect(deck.hands.player).toEqual(jasmine.any(Object))
    expect(deck.hands.dealer).toEqual(jasmine.any(Object))

describe "Blackjack-view", ->

  blackjackView = null

  beforeEach ->
    deck = new Deck()
    blackjackView = new BlackjackView({collection: deck})

  describe "hit", ->

    it "should be a method on blackjackView", ->
      expect(blackjackView.hit).toEqual(jasmine.any(Function))

    it "should reduce the length of the gamedeck by one when called", ->
      gamedeckStartLength = blackjackView.collection.stack.length
      blackjackView.hit()
      gamedeckEndLength = blackjackView.collection.stack.length
      expect(gamedeckEndLength).toEqual(gamedeckStartLength - 1)

describe "HandView", ->

  xit "should push two cards to hands array when it is initialized", ->
    deck = new Deck()
    playerHandView = new HandView({collection : deck.hands.player})
    expect(playerHandView).toBe()

describe "Hand", ->

  xit "should push two cards to hands array when it is initialized", ->
    deck = new Deck()
    playerHandView = new HandView({collection : deck.hands.player})
    expect(playerHandView).toBe()