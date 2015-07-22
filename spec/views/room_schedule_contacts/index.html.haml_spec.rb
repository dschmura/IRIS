

describe "room_schedule_contacts/index" do
  before(:each) do
    assign(:room_schedule_contacts, [
      stub_model(RoomScheduleContact),
      stub_model(RoomScheduleContact)
    ])
  end

  it "renders a list of room_schedule_contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
