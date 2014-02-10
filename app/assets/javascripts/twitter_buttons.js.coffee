twttr_events_bound = false

$ ->
  bindTwitterEventHandlers() unless twttr_events_bound

bindTwitterEventHandlers = ->
  renderTweetButtons()
  $(document).on 'page:load', renderTweetButtons
  twttr_events_bound = true

loadTwitter = ->
  $('<script/>', {
    id: 'twitter-widgets',
    src: '//platform.twitter.com/widgets.js',
    async: true
  }).appendTo($('head'))

renderTweetButtons = ->
  buttons = $('.twitter-share-button, .twitter-follow-button')
  if buttons.length > 0
    return loadTwitter() if typeof twttr == 'undefined' and $('#twitter-widgets').length == 0

    buttons.each ->
      button = $(this)
      button.attr('data-url', document.location.href) unless button.data('url')?
      button.attr('data-text', document.title) unless button.data('text')?
    twttr.widgets.load()
