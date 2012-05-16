Factory.define :user do |user|
  user.name                   "Test User"
  user.email                  "user@sample.com"
  user.password               "foobar12"
  user.password_confirmation  "foobar12"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end