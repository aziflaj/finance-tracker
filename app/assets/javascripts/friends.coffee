# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_friend_lookup = () ->
  $('#friend-lookup-form').on 'ajax:before', (event, data, status) ->
    show_spinner()

  $('#friend-lookup-form').on 'ajax:after', (event, data, status) ->
    hide_spinner()

  $('#friend-lookup-form').on 'ajax:success', (event, data, status) ->
    $('#friend-lookup').replaceWith data
    init_friend_lookup()

  $('#friend-lookup-form').on 'ajax:error', (event, xhr, status, error) ->
    hide_spinner()
    $('#friend-lookup-results').replaceWith ''
    $('#friend-lookup-errors').replaceWith 'No people were found'

$(document).ready () ->
  init_friend_lookup()
