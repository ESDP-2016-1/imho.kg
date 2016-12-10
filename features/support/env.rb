require 'cucumber/rails'

ActionController::Base.allow_rescue = false

Cucumber::Rails::Database.javascript_strategy = :truncation


# ---Database cleaner before and after test---
begin
  DatabaseCleaner.clean_with(:truncation)

  DatabaseCleaner.strategy = :transaction
rescue NameError
    raise "You need to add database_cleaner to your gemfile(in the test: group)"
end


# ---- Config for Capybara-----
Capybara.ignore_hidden_elements = true
Capybara.default_max_wait_time = 15
Capybara.app_host = 'http://app.kg'
# ---For automated test with browser(Firefox as a default)
Capybara.default_driver = :selenium

# ------ Hooks ----------

