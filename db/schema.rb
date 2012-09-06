# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120906152716) do

  create_table "buildings", :force => true do |t|
    t.string   "building_code_heprod"
    t.integer  "location_id"
    t.string   "address"
    t.string   "address2"
    t.string   "city",                 :default => "Ann Arbor"
    t.string   "state",                :default => "Mi"
    t.string   "zip",                  :default => "48109"
    t.text     "description"
    t.text     "history"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "building_short_code"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "room_number"
    t.string   "facility_code_heprod"
    t.integer  "student_capacity"
    t.boolean  "light_control"
    t.boolean  "layout_platform"
    t.boolean  "layout_stage"
    t.boolean  "layout_tiered"
    t.boolean  "seating_auditorium"
    t.boolean  "seating_chairs_fixed"
    t.boolean  "seating_movable_tables_chairs"
    t.boolean  "seating_table_conference"
    t.boolean  "seating_tables_any"
    t.boolean  "seating_tables_fixed"
    t.boolean  "seating_tables_moveable"
    t.boolean  "sound_amplification"
    t.boolean  "ethernet_students"
    t.boolean  "power_students"
    t.boolean  "writing_surface_chalkboard_any"
    t.boolean  "writing_surface_chalkboard_25ft"
    t.boolean  "writing_surface_whiteboard_any"
    t.boolean  "writing_surface_whiteboard_25ft"
    t.boolean  "computer_classroom_any"
    t.boolean  "computer_classroom_mac"
    t.boolean  "computer_classroom_windows"
    t.boolean  "assisted_listening"
    t.boolean  "wheelchair_instructor"
    t.boolean  "dvd_player_regular"
    t.boolean  "dvd_player_blueray"
    t.boolean  "captioning_device"
    t.boolean  "podium_computer_any"
    t.boolean  "podium_computer_mac"
    t.boolean  "podium_computer_windows"
    t.boolean  "document_camera"
    t.boolean  "interactive_pen"
    t.boolean  "lecture_capture"
    t.boolean  "telephone"
    t.boolean  "video_conferencing"
    t.boolean  "projection_16mm_film"
    t.boolean  "projection_35mm_file"
    t.boolean  "projection_digital_data_video"
    t.boolean  "projection_traditional_slide"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.boolean  "is_department_space",             :default => false
    t.integer  "owner_id",                        :default => 1
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude",                   :limit => 255
    t.float    "longitude",                  :limit => 255
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gmaps"
    t.string   "type"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.string   "image"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "building_sign_file_name"
    t.string   "building_sign_content_type"
    t.integer  "building_sign_file_size"
    t.datetime "building_sign_updated_at"
    t.boolean  "visible",                                   :default => true
  end

  add_index "locations", ["locatable_id", "locatable_type"], :name => "index_locations_on_locatable_id_and_locatable_type"

  create_table "owners", :force => true do |t|
    t.string   "department_name"
    t.string   "facility_id"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.text     "notes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
