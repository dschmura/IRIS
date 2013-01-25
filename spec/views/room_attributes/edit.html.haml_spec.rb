require 'spec_helper'

describe "room_attributes/edit" do
  before(:each) do
    @room_attribute = assign(:room_attribute, stub_model(RoomAttribute))
  end

  it "renders the edit room_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_attributes_path(@room_attribute), :method => "post" do
    end
  end
end
