require 'spec_helper'

describe "room_attributes/show" do
  before(:each) do
    @room_attribute = assign(:room_attribute, stub_model(RoomAttribute))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
