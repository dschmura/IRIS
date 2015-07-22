

describe "room_attributes/index" do
  before(:each) do
    assign(:room_attributes, [
      stub_model(RoomAttribute),
      stub_model(RoomAttribute)
    ])
  end

  it "renders a list of room_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
