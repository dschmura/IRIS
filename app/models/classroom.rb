# == Schema Information
#
# Table name: classrooms
#
#  id                              :integer          not null, primary key
#  room_number                     :string(255)
#  facility_code_heprod            :string(255)
#  student_capacity                :integer
#  light_control                   :boolean
#  layout_platform                 :boolean
#  layout_stage                    :boolean
#  layout_tiered                   :boolean
#  seating_auditorium              :boolean
#  seating_chairs_fixed            :boolean
#  seating_movable_tables_chairs   :boolean
#  seating_table_conference        :boolean
#  seating_tables_any              :boolean
#  seating_tables_fixed            :boolean
#  seating_tables_moveable         :boolean
#  sound_amplification             :boolean
#  ethernet_students               :boolean
#  power_students                  :boolean
#  writing_surface_chalkboard_any  :boolean
#  writing_surface_chalkboard_25ft :boolean
#  writing_surface_whiteboard_any  :boolean
#  writing_surface_whiteboard_25ft :boolean
#  computer_classroom_any          :boolean
#  computer_classroom_mac          :boolean
#  computer_classroom_windows      :boolean
#  assisted_listening              :boolean
#  wheelchair_instructor           :boolean
#  dvd_player_regular              :boolean
#  dvd_player_blueray              :boolean
#  captioning_device               :boolean
#  podium_computer_any             :boolean
#  podium_computer_mac             :boolean
#  podium_computer_windows         :boolean
#  document_camera                 :boolean
#  interactive_pen                 :boolean
#  lecture_capture                 :boolean
#  telephone                       :boolean
#  video_conferencing              :boolean
#  projection_16mm_film            :boolean
#  projection_35mm_file            :boolean
#  projection_digital_data_video   :boolean
#  projection_traditional_slide    :boolean
#  notes                           :text
#  created_at                      :datetime
#  updated_at                      :datetime
#  location_id                     :integer
#  is_department_space             :boolean          default(FALSE)
#  owner_id                        :integer          default(1)
#  rmrecnbr                        :integer
#  DEPT_GRP                        :string(255)
#

class Classroom < ActiveRecord::Base
  resourcify
  has_one :location, :as => :locatable
  has_one :building
  has_one :owner
  has_one :room_schedule_contact
  has_many :room_attributes
  #scope :visible, lambda { |visible| where(:visible => 'true') unless user.has_role? :admin }
  
  scope :visible, lambda { includes(:location).where("locations.visible = ?", true )    }
  


  
  
  accepts_nested_attributes_for :location, :allow_destroy => true  
  validates_presence_of :location_id
  #attr_accessible :room_number, :facility_code_heprod, :student_capacity, 
  #                :light_control, :layout_platform, :layout_stage, :layout_tiered, 
  #                :seating_auditorium, :seating_chairs_fixed, :seating_movable_tables_chairs, 
  #                :seating_table_conference, :seating_tables_any, :seating_tables_fixed, 
  #                :seating_tables_moveable, :sound_amplification, :ethernet_students, 
  #                :power_students, :writing_surface_chalkboard_any, :writing_surface_chalkboard_25ft, 
  #                :writing_surface_whiteboard_any, :writing_surface_whiteboard_25ft, 
  #                :computer_classroom_any, :computer_classroom_mac, :computer_classroom_windows, 
  #                :assisted_listening, :wheelchair_instructor, :dvd_player_regular, :dvd_player_blueray, 
  #                :captioning_device, :podium_computer_any, :podium_computer_mac, :podium_computer_windows, 
  #                :document_camera, :interactive_pen, :lecture_capture, :telephone, :video_conferencing, 
  #                :projection_16mm_film, :projection_35mm_file, :projection_digital_data_video, 
  #                :projection_traditional_slide, :notes, :location_id, :is_department_space, 
  #                :owner_id, :rmrecnbr
  
  validates :student_capacity, :numericality => true,
                               :length => {:within => 1..2000},
                               :presence => true
                               
  validates :room_number, :presence => true,
                          :length => {:minimum => 1, :maximum => 6}
                               
  #validates :facility_code_heprod,  :presence => true,
  #                                  :uniqueness => true,
  #                                  :format => {:with => /\A(\D{2,6})+(\d{1,6})+(\z)/i}, :on => :create
                                    
  #validates :rmrecnbr,  :presence => true,
  #                      :uniqueness => true,
  #                      :numericality => true,
  #                      :length => { :is => 7 }
                      
  

  
  #Makes for links on the site more SEO friendly
  def to_param
    "#{facility_code_heprod.upcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def zero_attributes(facility_code_heprod)
    attributes = ["light_control" , "layout_platform" , "layout_stage" , 
                  "layout_tiered" , "seating_auditorium" , "seating_chairs_fixed" , 
                  "seating_movable_tables_chairs" , "seating_table_conference" , 
                  "seating_tables_any" , "seating_tables_fixed" , "seating_tables_moveable" , 
                  "sound_amplification" , "sound_amplification" , "ethernet_students" , 
                  "power_students" , "writing_surface_chalkboard_any" , "writing_surface_chalkboard_25ft" , 
                  "writing_surface_whiteboard_any" , "writing_surface_whiteboard_25ft" , 
                  "computer_classroom_any" , "computer_classroom_any" , "computer_classroom_mac" , 
                  "computer_classroom_windows" , "assisted_listening" , "wheelchair_instructor" , 
                  "dvd_player_regular" , "dvd_player_blueray" , "captioning_device" , "podium_computer_mac" , 
                  "podium_computer_windows" , "document_camera" , "interactive_pen" , 
                  "lecture_capture" , "telephone" , "video_conferencing" , "projection_16mm_film" , 
                  "projection_35mm_file" , "projection_digital_data_video" , "projection_traditional_slide"]
    @room = Classroom.find_by_facility_code_heprod(facility_code_heprod)  
    attributes.each do |attribute|
      @room[attribute] = false
      @room.save!
    end 
  end
  
  def self.import(file)
    #map the heprod CHRSTC_DESCRSHORT to our db column
    mapping = {
      "Blackout" => :light_control,
      "Platform" => :layout_platform,
      "Stage" => :layout_stage,
      "FloorTier" => :layout_tiered,
      "AudSeat" => :seating_auditorium,
      "ChairFix" => :seating_chairs_fixed,
      "MoveTablet" => :seating_movable_tables_chairs,
      "TablesConf" => :seating_table_conference,
      "TablesAny" => :seating_tables_any,
      "TablesFix" => :seating_tables_fixed,
      "TablesMov" => :seating_tables_moveable,
      "SoundPrgrm" => :sound_amplification,
      "SoundVoice" => :sound_amplification,
      "EthrStud" => :ethernet_students,
      "PowerStud" => :power_students,
      "Chkbrd" => :writing_surface_chalkboard_any,
      "Chkbrd>25" => :writing_surface_chalkboard_25ft,
      "Whtbrd" => :writing_surface_whiteboard_any,
      "Whtbrd>25" => :writing_surface_whiteboard_25ft,
      "CompAny" => :computer_classroom_any,
      "CompMac" => :computer_classroom_mac,
      "CompPC" => :computer_classroom_windows,
      "AssistLis" => :assisted_listening,
      "WCInst" => :wheelchair_instructor,
      "DVD" => :dvd_player_regular,
      "BluRay" => :dvd_player_blueray,
      "CaptionDev" => :captioning_device,
      "CompPodMac" => :podium_computer_mac,
      "CompPodPC" => :podium_computer_windows,
      "DocCam" => :document_camera,
      "IntrPen" => :interactive_pen,
      "LectureCap" => :lecture_capture,
      "Telephone" => :telephone,
      "VideoConf" => :video_conferencing,
      "Proj16mm" => :projection_16mm_film,
      "Proj35mm" => :projection_35mm_file,
      "ProjDigit" => :projection_digital_data_video,
      "ProjSlide" => :projection_traditional_slide
    }
    
    last_rmrecnbr = nil
    this_classroom = nil
    CSV.foreach(file.path, headers: true) do |row|
       
      if last_rmrecnbr != row["RMRECNBR"]
        this_classroom && this_classroom.save!
        this_classroom = Classroom.find_by_rmrecnbr(row["RMRECNBR"])
        if this_classroom
          
          attributes = ["light_control" , "layout_platform" , "layout_stage" , 
                      "layout_tiered" , "seating_auditorium" , "seating_chairs_fixed" , 
                      "seating_movable_tables_chairs" , "seating_table_conference" , 
                      "seating_tables_any" , "seating_tables_fixed" , "seating_tables_moveable" , 
                      "sound_amplification" , "sound_amplification" , "ethernet_students" , 
                      "power_students" , "writing_surface_chalkboard_any" , "writing_surface_chalkboard_25ft" , 
                      "writing_surface_whiteboard_any" , "writing_surface_whiteboard_25ft" , 
                      "computer_classroom_any" , "computer_classroom_any" , "computer_classroom_mac" , 
                      "computer_classroom_windows" , "assisted_listening" , "wheelchair_instructor" , 
                      "dvd_player_regular" , "dvd_player_blueray" , "captioning_device" , "podium_computer_mac" , 
                      "podium_computer_windows" , "document_camera" , "interactive_pen" , 
                      "lecture_capture" , "telephone" , "video_conferencing" , "projection_16mm_film" , 
                      "projection_35mm_file" , "projection_digital_data_video" , "projection_traditional_slide"]
                      attributes.each do |attribute|
                        this_classroom[attribute] = false
                        this_classroom.save!
                      end
                    else
                    end
        #zero_attributes(this_classroom)

        last_rmrecnbr = row["RMRECNBR"]
      end
      
      if this_classroom
        logger.info { this_classroom.facility_code_heprod }                     
      else
        logger.info { "NOT FOUND: #{row["RMRECNBR"]}" }
        next
      end
      this_characteristic = row["CHRSTC_DESCRSHORT"]
      
      if mapping[this_characteristic]
        this_classroom[mapping[this_characteristic]] = true
      end
      
      case this_characteristic
      when "Other"          
        #Some logic here
      else
         #Some other logic here
      end  
    end # foreach line in csv
    
    # Save last room
    this_classroom && this_classroom.save!
    
  end
  
end

