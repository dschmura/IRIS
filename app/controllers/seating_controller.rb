class SeatingController < ApplicationController::Base

  def seating
   
      #@classroom = Classroom.find(params[:id])
      @classroom = Classroom.find_by_facility_code_heprod(params[:id].upcase)
      @page_title = @classroom.location.name
      @classroom_alt = @classroom.location.name + " - " + @classroom.room_number
      @building = find_building(@classroom.location_id)
      @owner = Owner.find(@classroom.owner_id)
      @room_schedule_contact = RoomScheduleContact.find_by_RMRECNBR(@classroom.rmrecnbr)
      #@room_attributes = RoomAttribute.find_all_by_RMRECNBR(@classroom.rmrecnbr)

      @building_image = @building.picture.url(:medium).to_s
      @building_sign_image = @building.building_sign.url(:thumb).to_s
      

      
      respond_to do |format|
        format.html # show.html.erb
        format.
        png  { render :qrcode => "http://rooms.lsa.umich.edu/classrooms/#{@classroom.facility_code_heprod}", :level => :l, :unit => 8 }
    
  end
  private

   def find_classroom  
     Classroom.find_by_facility_code_heprod(params[:id].upcase)
   end

   def find_building location_id    
     Location.find(location_id)
   end
  
end
