readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $('#avatar-img').removeClass('hidden')
      $('#avatar-img').attr 'src', e.target.result
      return

    reader.readAsDataURL input.files[0]
  return

$ ->
  $('#student_avatar').change ->
    readURL this
    return


  $('#upload-btn').on 'click', (e) ->
    e.preventDefault
    $('#student_avatar').click()
