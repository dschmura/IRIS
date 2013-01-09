source 'http://rubygems.org'

gem 'rails', '~> 3.2.11'
gem 'simple_form'
gem "meta_search"
#gem "ransack"
gem 'geocoder'
#gem 'geo_location'
## Used for uploading and resizing images (Need both paperclip and mini_magick)
gem 'paperclip', '~> 3.0'
gem 'mini_magick'
# User authentication management
gem 'devise'
# User authorization management
#gem 'declarative_authorization'
gem 'cancan'
gem "rolify", ">= 3.2.0"
#gem 'therubyracer', :require => 'v8'

# gem 'rack-rewrite'

gem 'haml'
group :production do
  #gem 'mysql'
  gem 'sqlite3'
  gem 'faker'
  gem 'unicorn'
end

gem 'sqlite3'


#gem 'haml'
gem 'haml-rails'    
#gem 'compass', '~> 0.12.alpha'
gem 'compass-rails'

gem 'gravatar_image_tag'
gem "will_paginate", "~> 3.0"


# Deploy with Capistrano
gem 'capistrano'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
   gem 'sqlite3-ruby', :require => 'sqlite3'
   gem 'rspec-rails'
   gem 'annotate'
   gem 'faker'
end

group :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec'
  gem 'spork', '~>0.9.0.rc5'
  gem 'webrat'
  gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>=1.0.3'
  gem 'therubyracer', :require => 'v8'
  gem 'libv8', '>= 3.11.8.3'
  gem "bootstrap-sass", ">= 2.1.0.0"
end

gem 'jquery-rails', '~> 2.0.0'
