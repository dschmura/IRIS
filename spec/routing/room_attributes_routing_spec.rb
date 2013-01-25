require "spec_helper"

describe RoomAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/room_attributes").should route_to("room_attributes#index")
    end

    it "routes to #new" do
      get("/room_attributes/new").should route_to("room_attributes#new")
    end

    it "routes to #show" do
      get("/room_attributes/1").should route_to("room_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/room_attributes/1/edit").should route_to("room_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/room_attributes").should route_to("room_attributes#create")
    end

    it "routes to #update" do
      put("/room_attributes/1").should route_to("room_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/room_attributes/1").should route_to("room_attributes#destroy", :id => "1")
    end

  end
end
