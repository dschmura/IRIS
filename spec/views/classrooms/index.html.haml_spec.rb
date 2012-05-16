require 'spec_helper'

describe "classrooms/index.html.haml" do
  before(:each) do
    assign(:classrooms, [
      stub_model(Classroom,
        :room_number => "Room Number",
        :facility_code_heprod => "Facility Code Heprod",
        :student_capacity => 1,
        :light_control => false,
        :layout_platform => false,
        :layout_stage => false,
        :layout_tiered => false,
        :seating_auditorium => false,
        :seating_chairs_fixed => false,
        :seating_movable_tables_chairs => false,
        :seating_table_conference => false,
        :seating_tables_any => false,
        :seating_tables_fixed => false,
        :seating_tables_moveable => false,
        :sound_amplification => false,
        :ethernet_students => false,
        :power_students => false,
        :writing_surface_chalkboard_any => false,
        :writing_surface_chalkboard_25ft => false,
        :writing_surface_whiteboard_any => false,
        :writing_surface_whiteboard_25ft => false,
        :computer_classroom_any => false,
        :computer_classroom_mac => false,
        :computer_classroom_windows => false,
        :assisted_listening => false,
        :wheelchair_instructor => false,
        :dvd_player_regular => false,
        :dvd_player_blueray => false,
        :captioning_device => false,
        :podium_computer_any => false,
        :podium_computer_mac => false,
        :podium_computer_windows => false,
        :document_camera => false,
        :interactive_pen => false,
        :lecture_capture => false,
        :telephone => false,
        :video_conferencing => false,
        :projection_16mm_film => false,
        :projection_35mm_file => false,
        :projection_digital_data_video => false,
        :projection_traditional_slide => false,
        :notes => "MyText"
      ),
      stub_model(Classroom,
        :room_number => "Room Number",
        :facility_code_heprod => "Facility Code Heprod",
        :student_capacity => 1,
        :light_control => false,
        :layout_platform => false,
        :layout_stage => false,
        :layout_tiered => false,
        :seating_auditorium => false,
        :seating_chairs_fixed => false,
        :seating_movable_tables_chairs => false,
        :seating_table_conference => false,
        :seating_tables_any => false,
        :seating_tables_fixed => false,
        :seating_tables_moveable => false,
        :sound_amplification => false,
        :ethernet_students => false,
        :power_students => false,
        :writing_surface_chalkboard_any => false,
        :writing_surface_chalkboard_25ft => false,
        :writing_surface_whiteboard_any => false,
        :writing_surface_whiteboard_25ft => false,
        :computer_classroom_any => false,
        :computer_classroom_mac => false,
        :computer_classroom_windows => false,
        :assisted_listening => false,
        :wheelchair_instructor => false,
        :dvd_player_regular => false,
        :dvd_player_blueray => false,
        :captioning_device => false,
        :podium_computer_any => false,
        :podium_computer_mac => false,
        :podium_computer_windows => false,
        :document_camera => false,
        :interactive_pen => false,
        :lecture_capture => false,
        :telephone => false,
        :video_conferencing => false,
        :projection_16mm_film => false,
        :projection_35mm_file => false,
        :projection_digital_data_video => false,
        :projection_traditional_slide => false,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of classrooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Room Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Facility Code Heprod".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
