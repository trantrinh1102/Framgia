$(document).ready ->
  $('span.dropdown').hover (->
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn 500
    return
  ), ->
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut 500
    return
  return
