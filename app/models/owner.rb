# == Schema Information
#
# Table name: owners
#
#  id              :integer          not null, primary key
#  department_name :string(255)
#  facility_id     :string(255)
#  contact_name    :string(255)
#  contact_phone   :string(255)
#  contact_email   :string(255)
#  notes           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  url             :string(255)
#

class Owner < ActiveRecord::Base
  belongs_to :classroom
  accepts_nested_attributes_for :classroom, :allow_destroy => true

  def truncated_department_name
      truncate(value, :length => 40)
  end
end
