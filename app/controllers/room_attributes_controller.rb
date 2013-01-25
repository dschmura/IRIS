class RoomAttributesController < ApplicationController
  # GET /room_attributes
  # GET /room_attributes.json
  
  def import
    RoomAttribute.import(params[:file])
    redirect_to classrooms_url, notice: "Attributes Imported"
  end
  
  def index
    @room_attributes = RoomAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @room_attributes }
    end
  end

  # GET /room_attributes/1
  # GET /room_attributes/1.json
  def show
    @room_attribute = RoomAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room_attribute }
    end
  end

  # GET /room_attributes/new
  # GET /room_attributes/new.json
  def new
    @room_attribute = RoomAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_attribute }
    end
  end

  # GET /room_attributes/1/edit
  def edit
    @room_attribute = RoomAttribute.find(params[:id])
  end

  # POST /room_attributes
  # POST /room_attributes.json
  def create
    @room_attribute = RoomAttribute.new(params[:room_attribute])

    respond_to do |format|
      if @room_attribute.save
        format.html { redirect_to @room_attribute, notice: 'Room attribute was successfully created.' }
        format.json { render json: @room_attribute, status: :created, location: @room_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @room_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /room_attributes/1
  # PUT /room_attributes/1.json
  def update
    @room_attribute = RoomAttribute.find(params[:id])

    respond_to do |format|
      if @room_attribute.update_attributes(params[:room_attribute])
        format.html { redirect_to @room_attribute, notice: 'Room attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_attributes/1
  # DELETE /room_attributes/1.json
  def destroy
    @room_attribute = RoomAttribute.find(params[:id])
    @room_attribute.destroy

    respond_to do |format|
      format.html { redirect_to room_attributes_url }
      format.json { head :no_content }
    end
  end
end
