$ ->
  $('.datetimepicker').datetimepicker
    viewMode: 'years'
    format: 'DD/MM/YYYY'
    minDate: '1/1/1900'
    maxDate : 'now'

  $(".phone_number").mask("(000) 000-00000")
