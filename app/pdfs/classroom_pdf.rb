class ClassroomPdf < Prawn::Document
  include ClassroomsHelper
  def initialize(classroom)
    super(top_margin: 70, page_layout: :landscape)
    define_grid(:columns => 11, :rows => 4)
    @classroom = classroom 
    
    
    classroom_image
    classroom_instructions
    classroom_floor_map
    classroom_seating_chart
    logos
    stroke_axis(step_length: 25)
    #stroke_circle [0, 0], 10
    classroom_name
    classroom_capacity
    classroom_qr_code
   
  end
  
  def logos
    bounding_box([400,30 ], :width => 350) do
      image "#{Rails.root}/app/assets/images/MClassrooms_Logo.png", fit: [120, 120]
    end
  end
  
  def classroom_name
    bounding_box([0,500 ], :width => 350) do
      transparent(0) {stroke_bounds}
      text "#{@classroom.location.name}", size: 20, style: :bold, color: "3A5AA0"
    end
  end
  
  def classroom_image
    if File.exist?("#{@classroom.location.picture.path(:show)}")
    
      transparent(0.5) {stroke_bounds}
      image "#{@classroom.location.picture.path(:show)}",  fit: [375, 100], position: :right 

  end
  end
  
  def classroom_seating_chart 
    if File.exist?("#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png")   
    image "#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png", :fit => [300, 300], at:[400, 350]
  
    end
  end
  
  def classroom_floor_map
    if File.exist?("#{Rails.root}/public/maps/#{floor_map}")    
      image "#{Rails.root}/public/maps/#{floor_map}", :fit => [300 , 340], at:[025, 375] 
    end
  end

  def classroom_capacity
    y_position = cursor - 5
    bounding_box([0, y_position], :width => 225) do
      text "Student Capacity: #{@classroom.student_capacity}", size: 14, style: :bold
    end  
  end

  def classroom_qr_code
    y_position = cursor - 0
    bounding_box([650, 75], :width => 125) do
      qrcode = "http://rooms.lsa.umich.edu/classrooms/#{@classroom.student_capacity}"
      print_qr_code(qrcode, :extent=>85, stroke: false)
    end
  end
  
  def classroom_instructions
    y_position = cursor - 5
    bounding_box([370, 400], :width => 350) do
      text "Please return the furniture to this arrangement when finished.", size: 11, style: :bold
    end
  end

  def facility_code_heprod
    text "#{@classroom.facility_code_heprod}"
  end
end