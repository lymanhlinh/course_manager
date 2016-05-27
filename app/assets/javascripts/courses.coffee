$ ->
  $('.add-button').on 'click', ->
    $.ajax {
      url: 'courses/new',
      method: "GET",
      data: '',
      dataType: "script"
    }
