class Location < ActiveRecord::Base
  
  ## CarrierWave Method
  #mount_uploader :image, ImageUploader
  
  ## Paperclip method for uploading location images
  has_attached_file :picture, :styles => { :show => "1200x500#", :medium => "300x300>", :thumb => "100x100>" }, :convert_options => {:show => "-gravity center"}
  
  has_attached_file :building_sign, :styles => { :show => "600X360#", :medium => "320X200#", :thumb => "160X120#{}" }, :convert_options => {:show => "-gravity center"}
  
  belongs_to :locatable, :polymorphic => true
  belongs_to :location_type  
  validates_presence_of   :name
  validates :latitude, :presence => true,
                       :length => {:within => 9..18},
                       :numericality => true
  validates :longitude, :presence => true,
                        :length => {:within => 9..18},
                        :numericality => true
 
end

# == Schema Information
#
# Table name: locations
#
#  id                         :integer         not null, primary key
#  latitude                   :float(255)
#  longitude                  :float(255)
#  name                       :string(255)
#  description                :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  gmaps                      :boolean
#  type                       :string(255)
#  locatable_id               :integer
#  locatable_type             :string(255)
#  image                      :string(255)
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  building_sign_file_name    :string(255)
#  building_sign_content_type :string(255)
#  building_sign_file_size    :integer
#  building_sign_updated_at   :datetime
#

