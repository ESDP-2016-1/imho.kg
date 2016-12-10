When(/^нажимаю на ссылку "([^"]*)"$/) do |link|
  click_link link
  sleep(0.5)
end

When(/^нажимаю на кнопку "([^"]*)"$/) do |button|
  click_button button
  sleep(0.5)
end

When(/^ввожу в поле "([^"]*)" текст "([^"]*)"$/) do |k, v|
  fill_in k, with: v
  sleep(0.5)
end

When(/^нажимаю по XPATH "([^"]*)"$/) do |path|
  find(:xpath, path).click
  sleep(2)
end










# Given(/^зайти под пользователем "([^"]*)"$/) do |login|
#   @current_user = User.create!(
#       :name => login,
#       :role_id => 1,
#       :email => "#{login}@example.com",
#       :password => '123456',
#       :password_confirmation => '123456',
#       :confirmed_at => Time.now
#   )
#   @current_user.save
#
#   visit new_user_session_path
#   fill_in("Эл.почта", :with => "#{login}@example.com")
#   fill_in("Пароль", :with => '123456')
#   click_button("Вход")
# end
