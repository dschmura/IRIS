class RoomScheduleContactsController < ApplicationController
  before_filter :authenticate_user!
  
  def import
    RoomScheduleContact.import(params[:file])
    redirect_to root_url, notice: "Contacts Imported"
  end
  # GET /room_schedule_contacts
  # GET /room_schedule_contacts.json
  def index
    
    @room_schedule_contacts = RoomScheduleContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @room_schedule_contacts }
    end
  end

  # GET /room_schedule_contacts/1
  # GET /room_schedule_contacts/1.json
  def show
    @room_schedule_contact = RoomScheduleContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room_schedule_contact }
    end
  end

  # GET /room_schedule_contacts/new
  # GET /room_schedule_contacts/new.json
  def new
    @room_schedule_contact = RoomScheduleContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_schedule_contact }
    end
  end

  # GET /room_schedule_contacts/1/edit
  def edit
    @room_schedule_contact = RoomScheduleContact.find(params[:id])
  end

  # POST /room_schedule_contacts
  # POST /room_schedule_contacts.json
  def create
    @room_schedule_contact = RoomScheduleContact.new(params[:room_schedule_contact])

    respond_to do |format|
      if @room_schedule_contact.save
        format.html { redirect_to @room_schedule_contact, notice: 'Room schedule contact was successfully created.' }
        format.json { render json: @room_schedule_contact, status: :created, location: @room_schedule_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @room_schedule_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /room_schedule_contacts/1
  # PUT /room_schedule_contacts/1.json
  def update
    @room_schedule_contact = RoomScheduleContact.find(params[:id])

    respond_to do |format|
      if @room_schedule_contact.update_attributes(params[:room_schedule_contact])
        format.html { redirect_to @room_schedule_contact, notice: 'Room schedule contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room_schedule_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_schedule_contacts/1
  # DELETE /room_schedule_contacts/1.json
  def destroy
    @room_schedule_contact = RoomScheduleContact.find(params[:id])
    @room_schedule_contact.destroy

    respond_to do |format|
      format.html { redirect_to room_schedule_contacts_url }
      format.json { head :no_content }
    end
  end
end
