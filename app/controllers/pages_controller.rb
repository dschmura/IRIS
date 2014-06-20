class PagesController < ApplicationController
  skip_filter :redirect_https

  def home
    @page_title="Home"

  end

  def contact
    @page_title="Contact Us"
  end
  
  def about
    @page_title="About the MClassrooms site"
  end
  def dentistry
    @page_title="Dentistry Demo"
    #redirect_to classrooms_path, params["q" => {"DEPT_GRP_eq"=>"SCHOOL_DENTISTRY"}]

    #redirect_to "/classrooms", :q => params[ DEPT_GRP_eq => 'SCHOOL_DENTISTRY']
    #redirect_to "classrooms?utf8=✓&q%5BDEPT_GRP_eq%5D=SCHOOL_DENTISTRY&q%5Blocation_id_eq%5D=&q%5Bfacility_code_heprod_cont%5D=&q%5Bpodium_computer_any_or_podium_computer_mac_or_podium_computer_windows_true%5D=0&q%5Bcomputer_classroom_any_or_computer_classroom_mac_or_computer_classroom_windows_true%5D=0&q%5Bprojection_16mm_film_or_projection_35mm_file_or_projection_digital_data_video_or_projection_traditional_slide_true%5D=0&q%5Bdvd_player_regular_or_dvd_player_blueray_true%5D=0&q%5Bsound_amplification_true%5D=0&q%5Bdocument_camera_true%5D=0&q%5Blecture_capture_true%5D=0&q%5Bvideo_conferencing_true%5D=0&q%5Bstudent_capacity_gteq%5D=1&q%5Bstudent_capacity_lteq%5D=500&per_page=14&commit=Create+Search"
    #redirect_to :classrooms, :action => 'index', :DEPT_GRP_eq => 'SCHOOL_DENTISTRY'
    #redirect_to(classrooms_path(@search, :q => params[:DEPT_GRP_eq => :SCHOOL_DENTISTRY]))
    
    
  end
  
  def about_iss
    @page_title="About Instructional Support Services"
  end
  
  def faq
    @page_title="Frequently Asked Questions"
  end
  
  def iss_support
    @page_title="ISS Support"
  end
  
  def event_support
    @page_title="Event Support"
  end
  def privacy_policy
    @page_title="Privacy Policy"
  end
  def support
    @page_title="Support"
  end
  def development
    @page_title="Development"
  end

  def admin
    @page_title="Administration Jump Page"
  end



end