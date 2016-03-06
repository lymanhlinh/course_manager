Given(/^I am an anonymous student$/) do
  @student = nil
end

When(/^I visit the (.+) page$/) do |page|
  visit path_to(page)
end

When(/^I should be on the (.+) page$/) do |page|
  expect(current_path).to eq path_to(page)
end

And(/^I should see (.+) link$/) do |link|
  expect(page).to have_link(link)
end

And(/^I click on (.+) link$/) do |link|
  click_link link
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I fill on register form with my information$/) do
  @builded_student = build(:student)
  fill_in "Email", with: @builded_student.email
  fill_in "Password", with: @builded_student.password
  fill_in "Password confirmation", with: @builded_student.password
end

And(/^I click on (.+) button$/) do |button|
  click_button button
end


When(/^I active my student account$/) do
  @student = Student.find_by(email: @builded_student.email)
  visit student_confirmation_path(confirmation_token: @student.confirmation_token)
  step 'I should be on the student sign in page'
end

And(/^I login by my new account$/) do
  fill_in "Email", with: @builded_student.email
  fill_in "Password", with: @builded_student.password
  click_button 'Log in'
end
