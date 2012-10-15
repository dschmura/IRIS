module ApplicationHelper
  
  # Return a title on a per-page basis.
  # In the controller you can set the @page_title variable
  # The base_title gets joined with the @page_title
  def page_title
    base_title = "University of Michigan Classrooms"
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
   image_tag("LSA_ISS_Pill.png", :alt => "#{@base_title} is brought to you by LSA Instructional Support Services", :style => "height: 38px; float: left; position: relative; left: 0px; margin: 0px;")
  end
  def footer_logo_um
   image_tag("UniversityOfMichigan_wordmark.png", :alt => "#{@base_title} LSA Instructional Support Services is part of The University of Michigan", :style => "height: 22px; margin-left: 0px;")
  end
  
  def construction_sign
    image_tag("Open_For_Business_Sign.png", :alt => "We are open for change.  Please contribute your feedback.", :class => 'construction')
  end

end
