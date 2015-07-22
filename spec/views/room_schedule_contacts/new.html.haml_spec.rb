

describe "room_schedule_contacts/new" do
  before(:each) do
    assign(:room_schedule_contact, stub_model(RoomScheduleContact).as_new_record)
  end

  it "renders new room_schedule_contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => room_schedule_contacts_path, :method => "post" do
    end
  end
end
