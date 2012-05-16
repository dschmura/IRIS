require 'spec_helper'

describe "locations/index.html.haml" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :location_type_id => 1,
        :latitude => "Latitude",
        :longitude => "Longitude",
        :title => "Title",
        :abstract => "MyText"
      ),
      stub_model(Location,
        :location_type_id => 1,
        :latitude => "Latitude",
        :longitude => "Longitude",
        :title => "Title",
        :abstract => "MyText"
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
