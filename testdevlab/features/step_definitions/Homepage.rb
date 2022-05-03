Given('I am in home page') do
  #Locate TestDevLab icon on home
  @wait.until{@driver.find_element(:xpath, "//nav[@class='menu-bar w-msg']/div[1]/a[2]")}
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
