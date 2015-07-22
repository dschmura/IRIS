

describe "owners/index" do
  before(:each) do
    assign(:owners, [
      stub_model(Owner,
        :department_name => "Department Name",
        :facility_id => "Facility",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email",
        :notes => "MyText"
      ),
      stub_model(Owner,
        :department_name => "Department Name",
        :facility_id => "Facility",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :contact_email => "Contact Email",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of owners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Department Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Facility".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
