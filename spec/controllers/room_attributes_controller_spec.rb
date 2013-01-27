require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RoomAttributesController do

  # This should return the minimal set of attributes required to create a valid
  # RoomAttribute. As you add validations to RoomAttribute, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoomAttributesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all room_attributes as @room_attributes" do
      room_attribute = RoomAttribute.create! valid_attributes
      get :index, {}, valid_session
      assigns(:room_attributes).should eq([room_attribute])
    end
  end

  describe "GET show" do
    it "assigns the requested room_attribute as @room_attribute" do
      room_attribute = RoomAttribute.create! valid_attributes
      get :show, {:id => room_attribute.to_param}, valid_session
      assigns(:room_attribute).should eq(room_attribute)
    end
  end

  describe "GET new" do
    it "assigns a new room_attribute as @room_attribute" do
      get :new, {}, valid_session
      assigns(:room_attribute).should be_a_new(RoomAttribute)
    end
  end

  describe "GET edit" do
    it "assigns the requested room_attribute as @room_attribute" do
      room_attribute = RoomAttribute.create! valid_attributes
      get :edit, {:id => room_attribute.to_param}, valid_session
      assigns(:room_attribute).should eq(room_attribute)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RoomAttribute" do
        expect {
          post :create, {:room_attribute => valid_attributes}, valid_session
        }.to change(RoomAttribute, :count).by(1)
      end

      it "assigns a newly created room_attribute as @room_attribute" do
        post :create, {:room_attribute => valid_attributes}, valid_session
        assigns(:room_attribute).should be_a(RoomAttribute)
        assigns(:room_attribute).should be_persisted
      end

      it "redirects to the created room_attribute" do
        post :create, {:room_attribute => valid_attributes}, valid_session
        response.should redirect_to(RoomAttribute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved room_attribute as @room_attribute" do
        # Trigger the behavior that occurs when invalid params are submitted
        RoomAttribute.any_instance.stub(:save).and_return(false)
        post :create, {:room_attribute => {  }}, valid_session
        assigns(:room_attribute).should be_a_new(RoomAttribute)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RoomAttribute.any_instance.stub(:save).and_return(false)
        post :create, {:room_attribute => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested room_attribute" do
        room_attribute = RoomAttribute.create! valid_attributes
        # Assuming there are no other room_attributes in the database, this
        # specifies that the RoomAttribute created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RoomAttribute.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => room_attribute.to_param, :room_attribute => { "these" => "params" }}, valid_session
      end

      it "assigns the requested room_attribute as @room_attribute" do
        room_attribute = RoomAttribute.create! valid_attributes
        put :update, {:id => room_attribute.to_param, :room_attribute => valid_attributes}, valid_session
        assigns(:room_attribute).should eq(room_attribute)
      end

      it "redirects to the room_attribute" do
        room_attribute = RoomAttribute.create! valid_attributes
        put :update, {:id => room_attribute.to_param, :room_attribute => valid_attributes}, valid_session
        response.should redirect_to(room_attribute)
      end
    end

    describe "with invalid params" do
      it "assigns the room_attribute as @room_attribute" do
        room_attribute = RoomAttribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RoomAttribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => room_attribute.to_param, :room_attribute => {  }}, valid_session
        assigns(:room_attribute).should eq(room_attribute)
      end

      it "re-renders the 'edit' template" do
        room_attribute = RoomAttribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RoomAttribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => room_attribute.to_param, :room_attribute => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested room_attribute" do
      room_attribute = RoomAttribute.create! valid_attributes
      expect {
        delete :destroy, {:id => room_attribute.to_param}, valid_session
      }.to change(RoomAttribute, :count).by(-1)
    end

    it "redirects to the room_attributes list" do
      room_attribute = RoomAttribute.create! valid_attributes
      delete :destroy, {:id => room_attribute.to_param}, valid_session
      response.should redirect_to(room_attributes_url)
    end
  end

end