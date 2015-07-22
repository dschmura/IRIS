

describe "buildings/edit.html.haml" do
  before(:each) do
    @building = assign(:building, stub_model(Building,
      :building_code_heprod => "MyString",
      :location_id => 1,
      :name => "MyString",
      :address => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :description => "MyText",
      :history => "MyText"
    ))
  end

  it "renders the edit building form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buildings_path(@building), :method => "post" do
      assert_select "input#building_building_code_heprod", :name => "building[building_code_heprod]"
      assert_select "input#building_location_id", :name => "building[location_id]"
      assert_select "input#building_name", :name => "building[name]"
      assert_select "input#building_address", :name => "building[address]"
      assert_select "input#building_address2", :name => "building[address2]"
      assert_select "input#building_city", :name => "building[city]"
      assert_select "input#building_state", :name => "building[state]"
      assert_select "input#building_zip", :name => "building[zip]"
      assert_select "textarea#building_description", :name => "building[description]"
      assert_select "textarea#building_history", :name => "building[history]"
    end
  end
end
