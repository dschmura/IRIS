module ApplicationHelper
  
  # Return a title on a per-page basis.
  # In the controller you can set the @page_title variable
  # The base_title gets joined with the @page_title
  def page_title
    base_title = "Instructional Support Services"
    
    if @page_title.nil?
      base_title
    else
      "#{base_title} | #{@page_title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "University of Michigan LSA Logo", :class => "round")
  end
  def construction_sign
    image_tag("Open_For_Business_Sign.png", :alt => "We are open for change.  Please contribute your feedback.", :class => 'construction')
  end

end
