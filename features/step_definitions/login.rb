When(/^я на главной странице "([^"]*)", нажимаю на кнуопку  "([^"]*)"$/) do |site, button|
  visit(site)
  click(button)
end

When(/^выходит модульное окно, заполняем первую строку "([^"]*)" пишем туда  "([^"]*)"$/) do |arg1, arg2|
  pending
end

When(/^нажимаем на кнопку "([^"]*)"$/) do |btn|
  pending
end