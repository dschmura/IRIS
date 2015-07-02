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

require 'spec_helper'

describe RoomScheduleContact do
  pending "add some examples to (or delete) #{__FILE__}"
end
