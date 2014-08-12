class BuildingsController < ApplicationController
  ## We are going to check authentication before accessing anything but show and index
  before_filter :authenticate_user!, :except => [:index, :show]

  #after_action :verify_authorized, except: [:index]



  def index

    @buildings = Building
    #@buildings = BuildingPolicy::Scope.new(current_user, Building).resolve.paginate(:page => params[:page], :per_page => 15)
    #@buildings.paginate(:page => params[:page], :per_page => 100)

    matching_locations = @buildings.includes(:location)
    filtered_locations = matching_locations.select { |loc| loc.location.visible }
    if user_signed_in?
      filtered_locations = matching_locations
    else
      filtered_locations = matching_locations.select { |loc| loc.location.visible }
    end
    @buildings = filtered_locations.paginate(page: params[:page], per_page: @per_page)

    @page_title = "Buildings"
  end

  def show

    @building = Building.find(params[:id])

    @page_title = @building.location.name
    #@building_image = "buildings/" + @building.building_code_heprod + ".jpg"
    unless @building.location.visible? || user_signed_in?
      redirect_to users_path, :notice => "Must be authorized to see that building."
      return
      end

  end


  def new
    @building = Building.new

    @building.location = Location.new
    #@building.location.assets.build
    @page_title = "Add a New Building"
  end

  def edit
    @location = Location.find(params[:id])
    @building = Building.find(params[:id])

    @page_title = "Editing Building: " + Location.find(params[:id]).name
  end

  def create
    @building = Building.new(params[:building])
    if @building.save 
      redirect_to(@building, :notice => 'Building was successfully added.') 
    else
       render 'new' 
    end
  end

  def update
    @building = Building.find(params[:id])
    if @building.update_attributes(params[:building])
       redirect_to(@building, :notice => 'building was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to buildings_path, :flash => {:success => "Building destroyed."}
  end

end
