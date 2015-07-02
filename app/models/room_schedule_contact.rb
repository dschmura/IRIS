# == Schema Information
#
# Table name: room_schedule_contacts
#
#  id                   :integer          not null, primary key
#  rmrecnbr             :integer
#  rm_schd_cntct_name   :string(255)
#  rm_schd_email        :string(255)
#  rm_schd_cntct_phone  :string(255)
#  rm_det_url           :string(255)
#  rm_usage_guidlns_url :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  RM_SPPT_DEPTID       :string(255)
#  RM_SPPT_DEPT_DESCR   :string(255)
#  RM_SPPT_CNTCT_EMAIL  :string(255)
#  RM_SPPT_CNTCT_PHONE  :string(255)
#  RM_SPPT_CNTCT_URL    :string(255)
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
end
