require 'cucumber/rails'

ActionController::Base.allow_rescue = false

Cucumber::Rails::Database.javascript_strategy = :truncation


# ---Database cleaner before and after test---
DatabaseCleaner.strategy = :truncation

at_exit do
  DatabaseCleaner.clean_with(:truncation)
end


# ---- Config for Capybara-----
Capybara.ignore_hidden_elements = true
Capybara.default_max_wait_time = 15
Capybara.app_host = 'localhost:80'
# ---For automated test with browser(Firefox as a default)
Capybara.default_driver = :selenium





