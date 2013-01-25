require "spec_helper"

describe RoomScheduleContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/room_schedule_contacts").should route_to("room_schedule_contacts#index")
    end

    it "routes to #new" do
      get("/room_schedule_contacts/new").should route_to("room_schedule_contacts#new")
    end

    it "routes to #show" do
      get("/room_schedule_contacts/1").should route_to("room_schedule_contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/room_schedule_contacts/1/edit").should route_to("room_schedule_contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/room_schedule_contacts").should route_to("room_schedule_contacts#create")
    end

    it "routes to #update" do
      put("/room_schedule_contacts/1").should route_to("room_schedule_contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/room_schedule_contacts/1").should route_to("room_schedule_contacts#destroy", :id => "1")
    end

  end
end
