require 'spec_helper'

describe "buildings/index.html.haml" do
  before(:each) do
    assign(:buildings, [
      stub_model(Building,
        :building_code_heprod => "Building Code Heprod",
        :location_id => 1,
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :description => "MyText",
        :history => "MyText"
      ),
      stub_model(Building,
        :building_code_heprod => "Building Code Heprod",
        :location_id => 1,
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :description => "MyText",
        :history => "MyText"
      )
    ])
  end

  it "renders a list of buildings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Building Code Heprod".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
