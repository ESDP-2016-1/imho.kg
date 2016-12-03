#language :ru
When(/^я на главной странице "([^"]*)"$/) do |site|
  visit(site)
  sleep(30)
end
