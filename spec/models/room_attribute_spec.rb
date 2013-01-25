# == Schema Information
#
# Table name: room_attributes
#
#  id              :integer          not null, primary key
#  RMRECNBR        :integer
#  CHRSTC          :integer
#  CHRSTC_DESCR    :string(255)
#  CHRSTC_SCHEDULE :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe RoomAttribute do
  pending "add some examples to (or delete) #{__FILE__}"
end
