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

require 'spec_helper'

describe RoomScheduleContact do
  pending "add some examples to (or delete) #{__FILE__}"
end
