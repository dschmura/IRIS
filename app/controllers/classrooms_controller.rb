## Need to document

class ClassroomsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  #before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.xml
  def index    
    @page_title = "Classrooms"
    @search = Classroom.search(params[:search])
      if params[:per_page]
        @per_page = params[:per_page]
      else
        @per_page = 10  
       end
    @classrooms = @search.paginate(:page => params[:page], :per_page => @per_page).order("student_capacity desc")   # or @search.relation to lazy load in view
    @owners = "Owner"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classrooms }
      format.js
    end
  end
  
  def search
    @search = Classroom.search(params[:search])
    @classrooms = @search.all   # or @search.relation to lazy load in view
  end

  # GET /classrooms/1
  # GET /classrooms/1.xml
  def show
    #@classroom = Classroom.find(params[:id])  
    @classroom = Classroom.find_by_facility_code_heprod(params[:id].upcase)
    @page_title = @classroom.location.name
    @classroom_alt = @classroom.location.name + " - " + @classroom.room_number 
    @building = Location.find(@classroom.location_id)
    @owner = Owner.find(@classroom.owner_id)
    @building_image = @building.picture.url(:medium).to_s
    @building_sign_image = @building.building_sign.url(:thumb).to_s
    @search = Classroom.search(params[:search])

    #@classroom_herprod = Building.find(params[:location_id]).building_short_code
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @classroom }
    end
  end


  # GET /classrooms/new
  # GET /classrooms/new.xml
  def new
    @classroom = Classroom.new
    @classroom.location = Location.new
    @locations = Location.where(:locatable_type => "Building").order("name ASC")
    @buildings = Building.where(:id => @locations )

    @owners = Owner.all
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
    
    @classroom = Classroom.find_by_facility_code_heprod(params[:id].upcase)
    @location = Location.find(@classroom.location_id)
    @page_title = "Editing Classroom: " + @location.name
  end

  # POST /classrooms
  # POST /classrooms.xml
  def create
    #@building_code = Location.find(params[:classroom][:location_id])
    @classroom = Classroom.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to(@classroom, :notice => 'Classroom was successfully created.') }
        format.xml  { render :xml => @classroom, :status => :created, :location => @classroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.xml
  def update
    @classroom = Classroom.find_by_facility_code_heprod(params[:id].upcase)

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
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
    @classroom = Classroom.find_by_facility_code_heprod(params[:id].upcase)
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end

 
  private
  def sort_column
    params[:sort] || "room_number"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
end
