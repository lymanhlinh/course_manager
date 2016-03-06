def path_to(page_name)
  case page_name

    when /home/
      root_path
    when /student sign up/
      new_student_registration_path
    when /student sign in/
      new_student_session_path
    when /404 page/
      "404"
    when /422 page/
      "422"
    when /500 page/
      "500"
  end
end
