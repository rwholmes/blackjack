class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="new-game-button">New Game</button>
    <span>Win Count: <span class="win-count">0</span></span>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .new-game-button": ->
      # if @model.get('deck').length < 11
      #   alert 'Shuffling...'
      #   @model.set 'deck', deck = new Deck()
      # @model.set 'playerHand', @model.get('deck').dealPlayer()
      # @model.set 'dealerHand', @model.get('deck').dealDealer()
      # @render()
      $('.bottom').html('')
      new AppView(model: new App()).$el.prependTo '.bottom'

  initialize: ->
    @render()
    @model.get('playerHand').on 'bust', ->
      alert('Busted!!!')
    , @
    @model.get('dealerHand').on 'bust', ->
      alert('You win!!!')
    , @
    @model.get('playerHand').on 'stand', ->
      @model.dealerPlay()
    , @
    # @model.on 'change', -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  reDeal: ->
    @model.set('playerHand', @model.get('deck').dealPlayer())
