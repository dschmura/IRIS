class LocationsController < ApplicationController
  ## We are going to check authentication before accessing anything but show or index
  before_filter :authenticate_user!
  #after_action :verify_authorized, except: [  :edit, :index, :update]
  
  def index
    #@locatable = find_locatable
    #@locations = Location.paginate(:page => params[:page], :per_page => 10)
    @page_title = "Locations"
    #@locations = LocationPolicy::Scope.new(current_user, Location).resolve.paginate(:page => params[:page], :per_page => 15)
    if user_signed_in?
      @locations = Location.all.paginate(:page => params[:page], :per_page => 15)
    else
      @locations = Location.visible.where(visible: true).paginate(:page => params[:page], :per_page => 15)
    end
  end
  
  def show
    @location = Location.find(params[:id])
    @page_title = @location.name

  end

  def new
    @location = Location.new
    @page_title = "Add a New Location"
  end
  
  def edit
    @location = Location.find(params[:id])
    @page_title = "Editing - " + @location.name
  end

  def create
    @locatable = find_locatable
    @location = @locatable.locations.build(params[:location])
    if @location.save
      redirect_to([@location], :notice => 'Location was successfully created.')      
    end
  end

  def update
    @location = Location.find(params[:id])
    
    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to(locations_url) 
  end
  
  private
  
  def find_locatable  
    params.each do |name, value|  
      if name =~ /(.+)_id$/  
        return $1.classify.constantize.find(value)  
      else
        return "SUCKS"
      end  
      
    end  
    nil  
  end
end
