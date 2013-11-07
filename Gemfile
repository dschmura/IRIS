source 'https://rubygems.org'
gem 'rails', '3.2.14'
gem 'sqlite3'
gem 'font-awesome-rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  #gem 'font-awesome-sass-rails'
  
  gem 'sass-rails', '~> 3.2'
  #gem 'bootstrap-sass', '~> 2.3.1.0'
  #gem 'bootstrap-sass', '~> 2.3.1.2'
  gem 'bootstrap-sass', '2.3.2.1'
  #gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                                #:github => 'anjlab/bootstrap-rails'
  #gem 'sass-rails',   '~> 3.2.3'
  #gem 'bootstrap-sass', :git => 'git://github.com/intridea/bootstrap-sass.git', :branch => '3.0.0-wip'
end



gem 'jquery-rails', '2.2.1'
gem 'jquery-ui-rails'
gem "haml", ">= 4.0.0"
gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
gem "machinist", :group => :test
gem "factory_girl_rails", ">= 3.3.0", :group => [:development, :test]
gem "email_spec", ">= 1.2.1", :group => :test
gem "devise", "3.0.3"
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"


# QR-Code generation
gem 'rqrcode-rails3'
gem 'mini_magick'


gem "simple_form"
gem 'will_paginate', '~> 3.0'
gem "therubyracer", :group => :assets, :platform => :ruby
gem 'will_paginate-bootstrap'
#gem 'kaminari'

## Used for uploading and resizing images (Need both paperclip and mini_magick)

gem "paperclip", "~> 3.4.2"

#gem "meta_search"
gem "ransack"
gem 'annotate', ">=2.5.0"

group :production do
  gem 'unicorn'
end