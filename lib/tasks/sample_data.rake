require 'faker'

namespace :db do
  desc "Fill user database with sample data"
  
  ## Will invoke by typing rake db:populate (or the name of the task)
  task :populate => :environment do
    #reset the database
    Rake::Task['db:reset'].invoke
    make_users
    make_microposts
    make_relationships

    make_locations
    make_buildings
    make_classrooms
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@test.com",
                       :password => "foobar12",
                       :password_confirmation => "foobar12",
                       :active => "false")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@test.com"
    password = "foobar12"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      user.microposts.create!(:content => Faker::Lorem.sentence(5))
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers  = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end


def make_locations
  20.times do |n|
                
                latitude = "42.278103#{n+1}"
                longitude = "-83.736656#{n-1}"
                name = Faker::Name.name
                description = Faker::Lorem.sentences(3)
                locatable_id = "1#{n+1}"
                locatable_type = "Classroom"

  Location.create!(
               :latitude => latitude,
               :longitude => longitude,
               :name => name,
               :description => description,
               :locatable_id => locatable_id,
               :locatable_type => locatable_type
               )  
  end
end





def make_classrooms
  10.times do |n|
                
                facility_code_heprod = "USB22#{n+11}"

                location_id = "1#{n-1}"
                building_id = "1#{n-1}"
                description = Faker::Lorem.sentences(3)
                room_number = "223#{n+1}"
  Classroom.create!(
               :facility_code_heprod => facility_code_heprod,
               :location_id => location_id,
               :building_id => building_id,
               :description => description,
               :room_number => room_number
               )  
  end
end

