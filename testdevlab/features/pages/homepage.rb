class Homepage

  def initialize driver,wait
    @driver = driver
    @wait = wait
  end


  def validate_not_visible_subsections
    count = 0

    #Validating menu options
    count = count_displayed_child("sub-menu","link-icon")
    count += count_displayed_child("sub-menu","sub-menu-box")
    count += count_displayed_child("product-menu","product")

    if count > 0
      raise "Some element is visible without selecion"
    end

  end


  def count_parent_options(menu_class)
    return @driver.find_elements(:class, menu_class).size
  end


  def count_child_options(parent, menu_item, child_class)
    return @driver.find_elements(:class,parent)[menu_item].find_elements(:class, child_class).size
  end


  def count_displayed_child(parent, child)
    displayed_count = 0
    menu_size = count_parent_options(parent)

    if menu_size > 0
      for menu_item in 0..menu_size-1
        child_size = count_child_options(parent,menu_item,child)
        for child_item in 0..child_size-1
          if @driver.find_elements(:class, parent)[menu_item].find_elements(:class, child)[child_item].displayed?
            displayed_count += 1
          end
        end
      end
    end

    return displayed_count

  end


  def count_displayed_parent(parent)
    displayed_count = 0
    menu_size = count_parent_options(parent)

    for menu_item in 0..menu_size-1
      if @driver.find_elements(:class, parent)[menu_item].displayed?
        displayed_count += 1
      end
    end

    return displayed_count

  end


  def validate_headers_options
    header_options_count = count_parent_options("sub-menu")
    header_options_count += count_parent_options("product-menu")

    displayed_count = count_displayed_parent("sub-menu")
    displayed_count += count_displayed_parent("product-menu")

    if displayed_count < header_options_count
      raise "Can't see all the header options"
    end
  end

  def only_selected_child_visible(parent,child)

    menu_size = count_parent_options(parent)
    count_options = 0
    count_displayed = 0

    for menu_item in 0..menu_size-1
      if menu_item >= 1
        @wait.until {!(@driver.find_elements(:class,parent)[menu_item-1].find_element(:class, "sub-menu-box").displayed?)}
      end

      @driver.find_elements(:class, parent)[menu_item].click
      if @driver.find_elements(:class,parent)[menu_item].find_elements(:class,child).size > 0
        @wait.until {@driver.find_elements(:class,parent)[menu_item].find_elements(:class,child)[0].displayed?}
      end

      count_options = count_child_options(parent, menu_item, child)
      count_displayed = count_displayed_child(parent,child)

      if count_options != count_displayed
        raise "Not all the options are displayed"
      end

      #xpath method
      @driver.find_element(:xpath, "//*[@id='root']/div/div[2]/nav/div[1]/div[2]/div[1]").click

      #class method
      #@driver.find_element(:class, "custom-drop-down").click
    end

  end


  def validate_subsections_visibility
    only_selected_child_visible("sub-menu","link-icon")
    only_selected_child_visible("sub-menu","sub-menu-box")
    only_selected_child_visible("product-menu","product")
  end

end
