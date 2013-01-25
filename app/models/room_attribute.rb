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

class RoomAttribute < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :classroom
  accepts_nested_attributes_for :classroom, :allow_destroy => true
  
  attr_accessible :RMRECNBR, :CHRSTC, :CHRSTC_DESCR, :CHRSTC_DESCRSHORT, :CHRSTC_DESCR254, :CHRSTC_SCHEDULE
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      room_attributes = find_by_id(row[:id]) || new
      room_attributes.attributes = row.to_hash.slice(*accessible_attributes)
      room_attributes.save!
    
    end
    
  end
end
