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
    dealerScore = @getBestScore(dealerhand.scores())
    playerScore = @getBestScore(playerhand.scores())

    while dealerScore < 17
      dealerhand.hit()
      dealerScore = @getBestScore(dealerhand.scores())

    switch
      when dealerScore is 21 then alert 'dealer wins'
      when (dealerScore < playerScore and dealerScore < 21)
        wincount = JSON.parse(localStorage.getItem('scoreCount')) or 0
        $('.win-count').text(++wincount)
        localStorage.setItem('scoreCount', wincount)
        alert 'player wins'

      when (dealerScore > playerScore and dealerScore < 21) then alert 'dealer wins'
      when dealerScore is playerScore then alert 'push'


  getBestScore: (scores) ->
    a = scores[0]
    b = scores[1]
    if not b
      a
    else if b > 21
      a
    else
      b

