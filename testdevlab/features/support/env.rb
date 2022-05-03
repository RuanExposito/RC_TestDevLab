require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'
require 'selenium-webdriver'
require_relative "../pages/homepage.rb"
require_relative "../pages/contact.rb"
include Selenium::WebDriver::Support

Before do |scenario|
  @driver = Selenium::WebDriver.for :chrome
  @driver.navigate.to "https://www.testdevlab.com/"
  @driver.manage.window.maximize
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10) #Adding the wait to avoid "sleeps"
  @homepage = Homepage.new(@driver,@wait)
  @contact = Contact.new(@driver,@wait)
end

After do |scenario|
  @driver.quit
end
