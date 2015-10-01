module ClassroomsHelper

  # Displays Alert message for classrooms that require a technician
  # to operate. Rooms that require technicians are stored in the technician_required_rooms array
  # and indicated with the room facility_code_heprod variable.
  def technician_required
    technician_required_rooms = ['AHA', 'AHB', 'AHC', 'AHD', 'CHEM1800', 'EH1324', 'NS2140', 'LORCH140', 'MLB1200', 'MLB1400', 'MLB1420']
    technician_required_message = 'Alert: An LSA-ISS technician is required for most presentation needs. Please contact LSA-ISS for assistance.'
    tech_req = image_tag("Open_For_Business_Sign.png", :alt => "We are open for change.  Please contribute your feedback.", :class => 'construction')

    if technician_required_rooms.include? @classroom.facility_code_heprod
      technician_required_message
    end
  end

  def classroom_image
    @classroom.location.picture.url(:show).to_s

  end

  def attribute_true?(condition)
   if condition
    'attribute_true'
   else
    'attribute_false'
   end
  end

  def departmental_room?
    if  @classroom.DEPT_GRP == 'COLLEGE_OF_LSA'
      if @classroom.owner_id == 1
        "LSA ISS Room"
      else
        "Departmental Room"
      end
    elsif @classroom.DEPT_GRP == 'SCHOOL_DENTISTRY'
      'Dental School'
    elsif @classroom.DEPT_GRP == 'LAW_SCHOOL'
      'Law School'
    elsif @classroom.DEPT_GRP == 'COLLEGE_PHARMACY'
      'College of Pharmancy'
    elsif @classroom.DEPT_GRP == 'SCHOOL_PUB_POLICY'
      'Ford School of Public Policy'  
    elsif @classroom.DEPT_GRP == 'VP_ACAD_GRAD_STUDY'
      'Museum of Art'
    elsif @classroom.DEPT_GRP == 'SCHOOL_DENTISTRY'
      'School of Dentistry'
    elsif @classroom.DEPT_GRP == 'SCHOOL_EDUCATION'
      'School of Education'
    elsif @classroom.DEPT_GRP == 'SCHOOL_INFORMATION'
      'School of Information'
    elsif @classroom.DEPT_GRP == 'SCHOOL_NAT_RES_ENVIR'
      'School of Natural Resources and Environment'  
    elsif @classroom.DEPT_GRP == 'SCHOOL_SOCIAL_WORK'
      'School of Scoial Work'
    else
      'Departmental Room'
    end

  end

  def basement
    # Buildings with basements or other weird floors
    # AH (G)
    # CHEM (A)
    # EH (B)
    # EQ (B)
    # HH (G)
    # MH (G)
    # MLB (B)

    $basement = @classroom.facility_code_heprod
    prefix = "../maps/"
    suffix = ".html"
    case $basement
      # Angell Hall floors G or Auds point to ahg
    	when (/AHG|AHA|AHB|AHC|AHD/)
    	  "ah"
    	when /CHEMA/
    	  "chema"
    	when /DENTG/
    	  "/dentg"
    	when /DENTB/
    	  "dentb"
    	when /EHB/
    	  "ehb"
    	when /EQB/
    	  "eqb"
    	when /HHG/
    	  "hhg"
    	when /MHG/
    	  "mhg"
    	when /MLBB/
        "mlbb"
    	else
    	  "" + @classroom.facility_code_heprod.scan(/(\D+)+(\d)/).join.downcase
    	end



  end

  def floor_map
    floor_map = basement.split(".")[0] + ".jpg"
  end

end




