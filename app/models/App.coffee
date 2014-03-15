#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @wincount = 0

  dealerPlay: ->
    console.log('dealer playing')
    dealerhand = @get 'dealerHand'
    playerhand = @get 'playerHand'
    dealerhand.models[0].set('revealed', true)
    dealerScore = dealerhand.scores()[0]
    playerScore = playerhand.scores()[0]
    while dealerScore < 17
      dealerhand.hit()
      dealerScore = dealerhand.scores()[0]
    switch
      when dealerScore is 21 then alert 'dealer wins'
      when (dealerScore < playerScore and dealerScore < 21)
        alert 'player wins'
        # @wincount++
        wincount = parseInt($('.win-count').text())
        wincount++
        $('.win-count').text(wincount)

      when (dealerScore > playerScore and dealerScore < 21) then alert 'dealer wins'
      when dealerScore is playerScore then alert 'push'





