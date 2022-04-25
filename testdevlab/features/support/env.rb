require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'
require 'selenium-webdriver'
require_relative "../pages/homepage.rb"
require_relative "../pages/contact.rb"

Before do |scenario|
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to "https://www.testdevlab.com/"
  @driver.manage.window.maximize
  @homepage = Homepage.new(@driver)
  @contact = Contact.new(@driver)
end

After do |scenario|
  @driver.quit
end
