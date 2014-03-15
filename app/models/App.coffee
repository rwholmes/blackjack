#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @get('playerHand').on 'bust', ->
    #   @trigger 'busted'
    #   console.log 'yoasd'

  dealerPlay: ->
    console.log('dealer playing')
    dealerhand = @get 'dealerHand'
    dealerhand.models[0].set('revealed', true)
    score = dealerhand.scores()[0]
    while score < 17
      dealerhand.hit()
      score = dealerhand.scores()[0]
    # dealerhand.hit() if score < 17
    #   @dealerPlay()
