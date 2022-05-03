Feature: Automating TestDevLab Webpage

  @homepage
  Scenario: As a user I can access sub-sections of each sub-menu in the header of the homepage
  Given I am in home page
  And All the subsections are not visible
  When I see header options
  Then I must see each subsection while putting the mouseover each header option

  @contact
  Scenario: As a user I cannot send an empty message in ‘contact us’ page
  Given I am in contact us page
  When I click to send the message
  And I see the text for the required fields
  And The error icon on personal information fields
  Then I see the fields and texts in red
