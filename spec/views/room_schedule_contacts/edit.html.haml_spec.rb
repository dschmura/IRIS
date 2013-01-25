require 'spec_helper'

describe "room_schedule_contacts/edit" do
  before(:each) do
    @room_schedule_contact = assign(:room_schedule_contact, stub_model(RoomScheduleContact))
  end

  it "renders the edit room_schedule_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_schedule_contacts_path(@room_schedule_contact), :method => "post" do
    end
  end
end
