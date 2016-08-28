ready = ->
  $('body').on 'click', '#id_btn_follow', ->
    event.preventDefault()
    $.ajax
      type: 'post'
      url: '/relationships.json'
      dataType: 'json'
      data: followed_id:  $('#id_btn_follow').val()
      beforeSend: ->
        $('#id_btn_follow').prop 'disabled', true
        return
      success: (data) ->
        $('#follow_form').load document.URL + ' #follow_form'
        $('#stats').load document.URL + ' #stats'
        return
      error: (error_message) ->
        alert 'error' + error_message
        return
    return
  $('body').on 'click', '#id_btn_unfollow', ->
    event.preventDefault()
    $.ajax
      type: 'DELETE'
      url: '/relationships/' + $('#id_btn_unfollow').val()
      dataType: 'json'
      beforeSend: ->
        $('#id_btn_unfollow').prop 'disabled', true
        return
      success: (data) ->
        $('#follow_form').load document.URL + ' #follow_form'
        $('#stats').load document.URL + ' #stats'
        return
      error: (error_message) ->
        alert 'error' + error_message
        return
    return
  return
$(document).ready(ready)
$(document).on('page:load', ready)
