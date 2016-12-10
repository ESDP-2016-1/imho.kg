Before('@login_user') do
  visit new_user_session_path
  fill_in "Эл.почта", with:"user@example.com"
  fill_in "Пароль", with: "123456"
  click_button "Вход"
end

After('@logout') do
  find(:xpath, "//*[@id='navbar-collapse']/ul[2]/ul/li[2]/div/a/span").click
  find(:xpath, "//*[@id='navbar-collapse']/ul[2]/ul/li[2]/div/ul/li[3]/a").click
end