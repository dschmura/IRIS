

describe "locations/new.html.haml" do
  before(:each) do
    assign(:location, stub_model(Location,
      :location_type_id => 1,
      :latitude => "MyString",
      :longitude => "MyString",
      :title => "MyString",
      :abstract => "MyText"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_location_type_id", :name => "location[location_type_id]"
      assert_select "input#location_latitude", :name => "location[latitude]"
      assert_select "input#location_longitude", :name => "location[longitude]"
      assert_select "input#location_title", :name => "location[title]"
      assert_select "textarea#location_abstract", :name => "location[abstract]"
    end
  end
end
