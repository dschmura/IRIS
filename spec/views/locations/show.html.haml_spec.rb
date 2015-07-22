

describe "locations/show.html.haml" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_type_id => 1,
      :latitude => "Latitude",
      :longitude => "Longitude",
      :title => "Title",
      :abstract => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Latitude/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Longitude/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
