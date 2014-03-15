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
    firstcard = @get 'dealerHand'
    firstcard.models[0].set('revealed', true)
    console.log(firstcard, firstcard.models[0])

