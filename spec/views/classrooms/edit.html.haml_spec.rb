

describe "classrooms/edit.html.haml" do
  before(:each) do
    @classroom = assign(:classroom, stub_model(Classroom,
      :room_number => "MyString",
      :facility_code_heprod => "MyString",
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
    ))
  end

  it "renders the edit classroom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classrooms_path(@classroom), :method => "post" do
      assert_select "input#classroom_room_number", :name => "classroom[room_number]"
      assert_select "input#classroom_facility_code_heprod", :name => "classroom[facility_code_heprod]"
      assert_select "input#classroom_student_capacity", :name => "classroom[student_capacity]"
      assert_select "input#classroom_light_control", :name => "classroom[light_control]"
      assert_select "input#classroom_layout_platform", :name => "classroom[layout_platform]"
      assert_select "input#classroom_layout_stage", :name => "classroom[layout_stage]"
      assert_select "input#classroom_layout_tiered", :name => "classroom[layout_tiered]"
      assert_select "input#classroom_seating_auditorium", :name => "classroom[seating_auditorium]"
      assert_select "input#classroom_seating_chairs_fixed", :name => "classroom[seating_chairs_fixed]"
      assert_select "input#classroom_seating_movable_tables_chairs", :name => "classroom[seating_movable_tables_chairs]"
      assert_select "input#classroom_seating_table_conference", :name => "classroom[seating_table_conference]"
      assert_select "input#classroom_seating_tables_any", :name => "classroom[seating_tables_any]"
      assert_select "input#classroom_seating_tables_fixed", :name => "classroom[seating_tables_fixed]"
      assert_select "input#classroom_seating_tables_moveable", :name => "classroom[seating_tables_moveable]"
      assert_select "input#classroom_sound_amplification", :name => "classroom[sound_amplification]"
      assert_select "input#classroom_ethernet_students", :name => "classroom[ethernet_students]"
      assert_select "input#classroom_power_students", :name => "classroom[power_students]"
      assert_select "input#classroom_writing_surface_chalkboard_any", :name => "classroom[writing_surface_chalkboard_any]"
      assert_select "input#classroom_writing_surface_chalkboard_25ft", :name => "classroom[writing_surface_chalkboard_25ft]"
      assert_select "input#classroom_writing_surface_whiteboard_any", :name => "classroom[writing_surface_whiteboard_any]"
      assert_select "input#classroom_writing_surface_whiteboard_25ft", :name => "classroom[writing_surface_whiteboard_25ft]"
      assert_select "input#classroom_computer_classroom_any", :name => "classroom[computer_classroom_any]"
      assert_select "input#classroom_computer_classroom_mac", :name => "classroom[computer_classroom_mac]"
      assert_select "input#classroom_computer_classroom_windows", :name => "classroom[computer_classroom_windows]"
      assert_select "input#classroom_assisted_listening", :name => "classroom[assisted_listening]"
      assert_select "input#classroom_wheelchair_instructor", :name => "classroom[wheelchair_instructor]"
      assert_select "input#classroom_dvd_player_regular", :name => "classroom[dvd_player_regular]"
      assert_select "input#classroom_dvd_player_blueray", :name => "classroom[dvd_player_blueray]"
      assert_select "input#classroom_captioning_device", :name => "classroom[captioning_device]"
      assert_select "input#classroom_podium_computer_any", :name => "classroom[podium_computer_any]"
      assert_select "input#classroom_podium_computer_mac", :name => "classroom[podium_computer_mac]"
      assert_select "input#classroom_podium_computer_windows", :name => "classroom[podium_computer_windows]"
      assert_select "input#classroom_document_camera", :name => "classroom[document_camera]"
      assert_select "input#classroom_interactive_pen", :name => "classroom[interactive_pen]"
      assert_select "input#classroom_lecture_capture", :name => "classroom[lecture_capture]"
      assert_select "input#classroom_telephone", :name => "classroom[telephone]"
      assert_select "input#classroom_video_conferencing", :name => "classroom[video_conferencing]"
      assert_select "input#classroom_projection_16mm_film", :name => "classroom[projection_16mm_film]"
      assert_select "input#classroom_projection_35mm_file", :name => "classroom[projection_35mm_file]"
      assert_select "input#classroom_projection_digital_data_video", :name => "classroom[projection_digital_data_video]"
      assert_select "input#classroom_projection_traditional_slide", :name => "classroom[projection_traditional_slide]"
      assert_select "textarea#classroom_notes", :name => "classroom[notes]"
    end
  end
end
