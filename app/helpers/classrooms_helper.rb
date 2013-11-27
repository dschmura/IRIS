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
        "LSA ISS Classroom"
      else
        "Departmental Classroom"
      end
    elsif @classroom.DEPT_GRP == 'SCHOOL_DENTISTRY'
      'Dental School'
    else
      'Departmental Classroom'
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
    case $basement 
      # Angell Hall floors G or Auds point to ahg
    	when (/AHG|AHA|AHB|AHC|AHD/) 
    	  "../maps/ahg.html"
    	when /CHEMA/
    	  "../maps/chema8.html"
    	when /DENTG/
    	  "../maps/dentg.html"
    	when /DENTB/
    	  "../maps/dentb.html"    
    	when /EHB/
    	  "../maps/ehb.html"
    	when /EQB/
    	  "../maps/eqb.html"
    	when /HHG/
    	  "../maps/hhg.html"  
    	when /MHG/
    	  "../maps/mhg.html"
    	when /MLBB/
        "../maps/mlbb.html"  
    	else
    	  "../maps/" + @classroom.facility_code_heprod.scan(/(\D+)+(\d)/).join.downcase + ".html"
    	end
  end

end




