When(/^я на главной странице$/) do
  visit root_path
  sleep(0.5)
end

Then(/^должен увидеть текст "([^"]*)"$/) do |text|
  page.assert_text(text)
  sleep(2)
end

When(/^я на странице "([^"]*)"$/) do |page|
  visit page
  sleep(2)
end