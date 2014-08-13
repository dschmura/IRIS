# == Schema Information
#
# Table name: room_schedule_contacts
#
#  id                   :integer          not null, primary key
#  RMRECNBR             :integer
#  RM_SCHD_CNTCT_NAME   :string(255)
#  RM_SCHD_EMAIL        :string(255)
#  RM_SCHD_CNTCT_PHONE  :string(255)
#  RM_DET_URL           :string(255)
#  RM_USAGE_GUIDLNS_URL :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class RoomScheduleContact < ActiveRecord::Base
  # attr_accessible :title, :body
  
  
  belongs_to :classroom
  accepts_nested_attributes_for :classroom, :allow_destroy => true
  
  # Setup accessible (or protected) attributes for your model

  attr_accessible :rmrecnbr, :rm_schd_cntct_name, :rm_schd_email, :rm_schd_cntct_phone, :rm_usage_guidlns_url,
                  :RM_SPPT_DEPTID, :RM_SPPT_DEPT_DESCR, :RM_SPPT_CNTCT_EMAIL, :RM_SPPT_CNTCT_PHONE, :RM_SPPT_CNTCT_URL

  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      roomschedulecontact = find_by_rmrecnbr(row["RMRECNBR"]) || new
      roomschedulecontact.attributes = row.to_hash.slice(*accessible_attributes)
      roomschedulecontact.save!
    
    end
    


end
