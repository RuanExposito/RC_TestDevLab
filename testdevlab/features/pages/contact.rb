class Contact

  def initialize driver
    @driver = driver
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
    sleep(3)
    fields = @driver.find_elements(:class, "input-field")
    errors = []

    for el in fields do
      if el.text.split.size > 1
        errors << el.find_element(:class, "field-label")
      end
    end

    for color in errors do
      if !(color.css_value("color") == "rgba(201, 57, 57, 1)")
        raise "The fields color are wrong"
      end
    end
  end

end
