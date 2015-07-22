

describe "locations/edit.html.haml" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_type_id => 1,
      :latitude => "MyString",
      :longitude => "MyString",
      :title => "MyString",
      :abstract => "MyText"
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path(@location), :method => "post" do
      assert_select "input#location_location_type_id", :name => "location[location_type_id]"
      assert_select "input#location_latitude", :name => "location[latitude]"
      assert_select "input#location_longitude", :name => "location[longitude]"
      assert_select "input#location_title", :name => "location[title]"
      assert_select "textarea#location_abstract", :name => "location[abstract]"
    end
  end
end
