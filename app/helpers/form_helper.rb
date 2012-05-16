# app/helpers/form_helper.rb
module FormHelper
  def setup_location(location)
    location.building  ||= Building.new
    location
  end
    
end