
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://192.168.0.39:8080'
  config.app_host = 'http://localhost:8080'
end
