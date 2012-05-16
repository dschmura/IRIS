require 'spec_helper'

describe Classroom do
  pending "add some examples to (or delete) #{__FILE__}"
end









# == Schema Information
#
# Table name: classrooms
#
#  id                              :integer         not null, primary key
#  room_number                     :string(255)
#  facility_code_heprod            :string(255)
#  student_capacity                :integer
#  light_control                   :boolean
#  layout_platform                 :boolean
#  layout_stage                    :boolean
#  layout_tiered                   :boolean
#  seating_auditorium              :boolean
#  seating_chairs_fixed            :boolean
#  seating_movable_tables_chairs   :boolean
#  seating_table_conference        :boolean
#  seating_tables_any              :boolean
#  seating_tables_fixed            :boolean
#  seating_tables_moveable         :boolean
#  sound_amplification             :boolean
#  ethernet_students               :boolean
#  power_students                  :boolean
#  writing_surface_chalkboard_any  :boolean
#  writing_surface_chalkboard_25ft :boolean
#  writing_surface_whiteboard_any  :boolean
#  writing_surface_whiteboard_25ft :boolean
#  computer_classroom_any          :boolean
#  computer_classroom_mac          :boolean
#  computer_classroom_windows      :boolean
#  assisted_listening              :boolean
#  wheelchair_instructor           :boolean
#  dvd_player_regular              :boolean
#  dvd_player_blueray              :boolean
#  captioning_device               :boolean
#  podium_computer_any             :boolean
#  podium_computer_mac             :boolean
#  podium_computer_windows         :boolean
#  document_camera                 :boolean
#  interactive_pen                 :boolean
#  lecture_capture                 :boolean
#  telephone                       :boolean
#  video_conferencing              :boolean
#  projection_16mm_film            :boolean
#  projection_35mm_file            :boolean
#  projection_digital_data_video   :boolean
#  projection_traditional_slide    :boolean
#  notes                           :text
#  created_at                      :datetime
#  updated_at                      :datetime
#  location_id                     :integer
#  is_department_space             :boolean         default(FALSE)
#  owner_id                        :integer         default(1)
#

