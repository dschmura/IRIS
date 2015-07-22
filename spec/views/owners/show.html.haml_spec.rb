

describe "owners/show" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :department_name => "Department Name",
      :facility_id => "Facility",
      :contact_name => "Contact Name",
      :contact_phone => "Contact Phone",
      :contact_email => "Contact Email",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Department Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Facility/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
