class BuildingsController < ApplicationController
  ## We are going to check authentication before accessing anything but show and index
  #before_filter :authenticate_user!, :except => [:show, :create]

    after_action :verify_authorized, except: [ :show, :index]



  def index

    @buildings = Building.paginate(:page => params[:page], :per_page => 100)

    ##authorize @buildings
    @page_title = "Buildings"
  end

  def show

    @building = Building.find(params[:id])
    @page_title = @building.location.name
    @building_image = "buildings/" + @building.building_code_heprod + ".jpg"
  end


  def new
    @building = Building.new
    authorize @building
    @building.location = Location.new
    #@building.location.assets.build
    @page_title = "Add a New Building"
  end

  def edit
    @location = Location.find(params[:id])
    @building = Building.find(params[:id])
    authorize @building
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
