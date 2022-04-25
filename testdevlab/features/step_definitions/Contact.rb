Given('I am in contact us page') do
  @driver.find_element(:link_text, "CONTACT US").click
end

When('I click to send the message') do
  sleep(3)
  @driver.find_element(:class,"submit-button").click
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
