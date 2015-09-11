## Need to document

class ClassroomsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index, :seating]
  #before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]


  def import
    Classroom.import(params[:file])
    redirect_to classrooms_url, notice: "Attributes Imported"
  end

  # GET /classrooms
  # GET /classrooms.xml
  def index
    @page_title = "Classrooms"
    @search = Classroom.search(params[:q] )
    #set the default sort for the results
    @search.sorts = 'location_name asc' if @search.sorts.empty?
    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 15
    end
    if params[:DEPT_GRP]
      @dept_group = "SET"
    else
      @dept_group = "not set"
    end

    if @search.student_capacity_gteq.nil?
      @search.student_capacity_gteq = 1
      @search.student_capacity_lteq = 1400
    end
    matching_classrooms = @search.result.includes(:location)
    filtered_classrooms = matching_classrooms.select { |classroom| classroom.location.visible }
    if user_signed_in?
      filtered_classrooms = matching_classrooms
    else
      filtered_classrooms = matching_classrooms.select { |classroom| classroom.location.visible }
    end
    @classrooms = filtered_classrooms.paginate(page: params[:page], per_page: @per_page)
    @search_count = filtered_classrooms.count

    if user_signed_in?
      @locations = Location.all.paginate(:page => params[:page], :per_page => 15)
    else
      @locations = Location.visible.where(visible: true).paginate(:page => params[:page], :per_page => 15)
    end

    @owners = "Owner"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classrooms }
      format.js
    end
  end

  def search
    @search = policy_scope(Classroom).search(params[:q])
    @classrooms = @search.all   # or @search.relation to lazy load in view
  end


  # GET /classrooms/1
  # GET /classrooms/1.xml
  def show
    @classroom = Classroom.includes(:location).find_by facility_code_heprod:(params[:id].upcase)
    if @classroom == nil
      redirect_to classrooms_path, :notice => "That room cannot be located in our system."
      return
    end
    #@classroom = find_classroom
    unless @classroom.location.visible? || user_signed_in?
      redirect_to users_path, :notice => "Must be authorized to see that room."
      return
    end

    @page_title = @classroom.location.name
    @classroom_alt = @classroom.location.name + " - " + @classroom.room_number
    @building = find_building(@classroom.building_id)
    #@building = location.building
    #@owner = Owner.find(@classroom.owner_id)
    @room_schedule_contact = RoomScheduleContact.find_by rmrecnbr:(@classroom.rmrecnbr)
    @building_image = @building.picture.url(:medium).to_s
    @building_sign_image = @building.building_sign.url(:thumb).to_s
    @search = Classroom.search(params[:search])

    #@classroom_herprod = Building.find(params[:building_id]).building_short_code
    respond_to do |format|
      format.html # show.html.erb
      format.png  { render :qrcode => "http://rooms.lsa.umich.edu/classrooms/#{@classroom.facility_code_heprod}", :level => :l, :unit => 8 }
      format.pdf do
       pdf = ClassroomPdf.new(@classroom)

        send_data pdf.render, type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

# GET /classrooms/new
  # GET /classrooms/new.xml
  def new
    @classroom = Classroom.new
    @classroom.location = Location.new
    @locations = Location.where(:locatable_type => "Building").order("name ASC")
    @buildings = Building.where(:id => @locations )


    @owners = find_owners
    @client_ip = request.remote_ip
    @page_title = "Add A New Classroom"
    #@ip = GeoLocation.find('141.213.155.40')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    #@location = Location.find(params[:id])
    @classroom = find_classroom
    @location = Location.find(@classroom.building_id)
    @locations = Location.where(:locatable_type => "Building").order("name ASC")
    @owners = find_owners
    @page_title = "Editing Classroom: " + @location.name
  end

  # POST /classrooms
  # POST /classrooms.xml
  def create
    #@building_code = Location.find(params[:classroom][:building_id])
    @classroom = Classroom.new(app_params)
    @locations = Location.where(:locatable_type => "Building").order("name ASC")
    @owners = find_owners
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to(classrooms_path, :notice => "The #{@classroom.facility_code_heprod} Classroom was successfully created.") }
        format.xml  { render :xml => classrooms_path, :status => :created, :location => @classroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.xml
  def update
    @classroom = find_classroom

    @locations = Location.where(:locatable_type => "Building").order("name ASC")
    @owners = Owner.all.order("department_name ASC")

    respond_to do |format|
      if @classroom.update_attributes(app_params)
        format.html { redirect_to(@classroom, :notice => 'Classroom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.xml
  def destroy
    @classroom = find_classroom
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end

  private

  def app_params
    params.require(:classroom).permit(:room_number, :facility_code_heprod, :room_number, :facility_code_heprod, :student_capacity, :light_control, :layout_platform , :layout_stage , :layout_tiered, :seating_auditorium, :seating_chairs_fixed, :seating_movable_tables_chairs , :seating_table_conference , :seating_tables_any, :seating_tables_fixed, :seating_tables_moveable, :sound_amplification , :ethernet_students , :power_students, :writing_surface_chalkboard_any, :writing_surface_chalkboard_25ft , :writing_surface_whiteboard_any, :writing_surface_whiteboard_25ft , :computer_classroom_any , :computer_classroom_mac , :computer_classroom_windows, :assisted_listening, :wheelchair_instructor, :dvd_player_regular, :dvd_player_blueray, :captioning_device , :podium_computer_any , :podium_computer_mac , :podium_computer_windows, :document_camera , :interactive_pen , :lecture_capture , :telephone, :video_conferencing, :projection_16mm_film, :projection_35mm_file, :projection_digital_data_video , :projection_traditional_slide, :notes, :building_id, :is_department_space , :owner_id , :rmrecnbr , :DEPT_GRP , :sound_amplification_voice)
  end

  def find_classroom
    #Classroom.find_by_facility_code_heprod(params[:id].upcase)

    Classroom.find_by facility_code_heprod:(params[:id].upcase)
  end

  def find_owners
    Owner.all
  end

  def find_building building_id
    Location.find(building_id)
  end

  def sort_column
    params[:sort] || "room_number"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end