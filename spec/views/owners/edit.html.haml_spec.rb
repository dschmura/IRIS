

describe "owners/edit" do
  before(:each) do
    @owner = assign(:owner, stub_model(Owner,
      :department_name => "MyString",
      :facility_id => "MyString",
      :contact_name => "MyString",
      :contact_phone => "MyString",
      :contact_email => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit owner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => owners_path(@owner), :method => "post" do
      assert_select "input#owner_department_name", :name => "owner[department_name]"
      assert_select "input#owner_facility_id", :name => "owner[facility_id]"
      assert_select "input#owner_contact_name", :name => "owner[contact_name]"
      assert_select "input#owner_contact_phone", :name => "owner[contact_phone]"
      assert_select "input#owner_contact_email", :name => "owner[contact_email]"
      assert_select "textarea#owner_notes", :name => "owner[notes]"
    end
  end
end
