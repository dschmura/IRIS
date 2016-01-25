require 'csv'

namespace :import do

  desc "Import contact information for rooms"
  task room_schedule_contacts: :environment do
    filename = File.join Rails.root, 'contacts_test.csv'
    CSV.foreach(filename, headers: true) do |row|
      rmrecnbr, rm_schd_cntct_name, rm_schd_email , rm_schd_cntct_phone , rm_det_url, rm_usage_guidlns_url , RM_SPPT_DEPTID, RM_SPPT_DEPT_DESCR, RM_SPPT_CNTCT_EMAIL , RM_SPPT_CNTCT_PHONE , RM_SPPT_CNTCT_URL = row
      room = find_by_rmrecnbr(rmrecnbr) || new
      room.update_attributes(rm_schd_cntct_name: rm_schd_cntct_name, rm_schd_email: rm_schd_email, rm_schd_cntct_phone: rm_schd_cntct_phone, rm_det_url: rm_det_url, rm_usage_guidlns_url:  rm_usage_guidlns_url, RM_SPPT_DEPTID: RM_SPPT_DEPTID, RM_SPPT_DEPT_DESCR: RM_SPPT_DEPT_DESCR, RM_SPPT_CNTCT_EMAIL: RM_SPPT_CNTCT_EMAIL , RM_SPPT_CNTCT_PHONE: RM_SPPT_CNTCT_PHONE , RM_SPPT_CNTCT_URL: RM_SPPT_CNTCT_URL)
      
    end
  end
end