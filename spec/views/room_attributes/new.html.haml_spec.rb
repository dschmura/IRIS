require 'spec_helper'

describe "room_attributes/new" do
  before(:each) do
    assign(:room_attribute, stub_model(RoomAttribute).as_new_record)
  end

  it "renders new room_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_attributes_path, :method => "post" do
    end
  end
end
