module ApplicationHelper
  
  # Return a title on a per-page basis.
  # In the controller you can set the @page_title variable
  # The base_title gets joined with the @page_title
  def page_title
    base_title = "Instructional Support Services"
    @base_title = base_title
    if @page_title.nil?
      base_title
    else
      "#{base_title} | #{@page_title}"
    end
  end
  
  def logo
    image_tag("MClassrooms_Logo.png", :alt => "University of Michigan Logo", :width => "250", :style => "padding: 1em;", :class => "round")
  end
  def footer_logo
   image_tag("LSA_Logo.png", :alt => "#{@base_title} is brought to you by LSA Instructional Support Services", :style => "height: 35px; float: left;")
  end
  def footer_logo_um
   image_tag("UniversityOfMichigan_wordmark.png", :alt => "#{@base_title} is brought to you by LSA Instructional Support Services", :style => "height: 25px; float: right; padding-top: 5px;")
  end
  
  def construction_sign
    image_tag("Open_For_Business_Sign.png", :alt => "We are open for change.  Please contribute your feedback.", :class => 'construction')
  end

end
