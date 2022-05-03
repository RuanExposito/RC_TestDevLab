class Contact

  def initialize driver,wait
    @driver = driver
    @wait = wait
  end

  def validate_error_text
    errors = @driver.find_elements(:class, "field-error")
    for text in errors do
      if text.text != "This field is required"
        raise "Wrong error on required field"
      end
    end
  end


  def validate_error_icon
    fields = @driver.find_elements(:class, "input-field")
    errors = []

    for el in fields do
      if el.text.split.size > 1
        errors << el.find_element(:class, "error-icn")
      end
    end

    for icon in errors do
      if !(icon.displayed?)
        raise "The icon isn't appearing on required field"
      end
    end
  end

  def validate_red_fields
    #Xpath method
    @wait.until {Color.from_string(@driver.find_element(:xpath, "//*[@id='root']/div/div[3]/div/main/div/div[1]/div/div/form/div[1]/label").css_value("color")).hex== "#c93939"}

    #Class method
    #@wait.until {Color.from_string(@driver.find_element(:class, "input-field").find_element(:class, "field-label").css_value("color")).hex == "#c93939"}
    fields = @driver.find_elements(:class, "input-field")
    errors = []

    for el in fields do
      if el.text.split.size > 1
        errors << Color.from_string(el.find_element(:class, "field-label").css_value("color"))
      end
    end

    for color in errors do
      if color.hex != "#c93939"
        raise "The fields color are wrong"
      end
    end
  end

end
