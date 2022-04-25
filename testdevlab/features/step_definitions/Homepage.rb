Given('I am in home page') do
  sleep(3)
  @driver.find_element(:xpath, "//nav[@class='menu-bar w-msg']/div[1]/a[2]") #Locate TestDevLab icon on home
end

Given('All the subsections are not visible') do
  @homepage.validate_not_visible_subsections
end

When('I see header options') do
  @homepage.validate_headers_options
end

Then('I must see each subsection while putting the mouseover each header option') do
  @homepage.validate_subsections_visibility
end
