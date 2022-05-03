Given('I am in contact us page') do
  #xpath method
  @driver.find_element(:xpath, "//*[@id='root']/div/div[2]/nav/div[1]/div[2]/a").click

  #link_text method
  #@driver.find_element(:link_text, "CONTACT US").click
end

When('I click to send the message') do
  #xpath method
  @wait.until {@driver.find_element(:xpath,"//*[@id='root']/div/div[3]/div/main/div/div[1]/div/div/form/div[9]/div/button")}
  @driver.find_element(:xpath,"//*[@id='root']/div/div[3]/div/main/div/div[1]/div/div/form/div[9]/div/button").click

  #class method
  #@wait.until {@driver.find_element(:class,"submit-button")}
  #@driver.find_element(:class,"submit-button").click
end

When('I see the text for the required fields') do
  @contact.validate_error_text
end

When('The error icon on personal information fields') do
  @contact.validate_error_icon
end

Then('I see the fields and texts in red') do
  @contact.validate_red_fields
end
