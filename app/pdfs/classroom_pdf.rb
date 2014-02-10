class ClassroomPdf < Prawn::Document
  include ClassroomsHelper
  def initialize(classroom)
    super(top_margin: 70, page_layout: :landscape)
    define_grid(:columns => 11, :rows => 4)
    @classroom = classroom 
    @owner = Owner.find(@classroom.owner_id)
    
    classroom_image
    classroom_instructions
    #classroom_floor_map
    classroom_seating_chart
    logos
    #stroke_axis(step_length: 25)
    #stroke_circle [0, 0], 10
    classroom_name
    classroom_capacity
    classroom_qr_code
    classroom_url
    classroom_support_contact

   
  end
  
  def classroom_support_contact
    y_position = cursor + 250
    bounding_box([10, 150], width: 350) do
      text "Support for this room is provided by "
      text "<b><color rgb='3A5AA0'>#{@owner.department_name}</color></b>", inline_format: :true
      
      text "<b>Support Contact:</b> <color rgb='DD0806'> #{@owner.contact_email}</color>", inline_format: :true
      text "<b>Support Contact Phone:</b> <color rgb='DD0806'> #{@owner.contact_phone}</color>", inline_format: :true
    end
  end
  def logos
      image "#{Rails.root}/app/assets/images/MClassrooms_Logo.png", fit: [200, 200], at: [75, 70]
  end
  
  def classroom_url
    bounding_box([75,20 ], :width => 300) do
      transparent(0) {stroke_bounds}
      
      text "http://rooms.lsa.umich.edu/classrooms/#{@classroom.facility_code_heprod}", size: 12, color: "3A5AA0"
    end
  end
  
  def classroom_name
    bounding_box([10,500 ], :width => 350) do
      transparent(0) {stroke_bounds}
      text "#{@classroom.location.name}", size: 20, style: :bold, color: "3A5AA0"
    end
  end
  
  def classroom_image
    y_position = cursor - 460
    if File.exist?("#{@classroom.location.picture.path(:show)}")
    
      transparent(0.5) {stroke_bounds}
      image "#{@classroom.location.picture.path(:show)}",  fit: [350, 100], position: 10, vposition: y_position 

  end
  end
  

  
  def classroom_seating_chart 
    
    if File.exist?("#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png")   
    image "#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png", :fit => [330, 500], at:[400, 475]
  
    end
  end
  
  def classroom_floor_map
    if File.exist?("#{Rails.root}/public/maps/#{floor_map}")    
      image "#{Rails.root}/public/maps/#{floor_map}", :fit => [300 , 300], at:[025, 375] 
    end
  end

  def classroom_capacity
    y_position = cursor - 0
    bounding_box([10, y_position], :width => 225) do
      text "Student Capacity: #{@classroom.student_capacity}", size: 14, style: :bold
    end  
  end

  def classroom_qr_code
    y_position = cursor - 0
    bounding_box([0, 75], :width => 125) do
      qrcode = "http://rooms.lsa.umich.edu/classrooms/#{@classroom.student_capacity}"
      print_qr_code(qrcode, :extent=>85, stroke: false)
    end
  end
  
  def classroom_instructions
    y_position = cursor - 65
    bounding_box([10, y_position], :width => 400) do
      text "Please return the furniture to this arrangement when finished.", size: 12, style: :bold
    end
  end

  def facility_code_heprod
    text "#{@classroom.facility_code_heprod}"
  end
end