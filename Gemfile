source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Deploy with Capistrano
gem 'capistrano', '< 3.0'
# gem 'capistrano', '~> 3.1.0'
# # rails specific capistrano funcitons
# gem 'capistrano-rails', '~> 1.1.0'  
# # integrate bundler with capistrano
# gem 'capistrano-bundler'  
# 
# gem 'capistrano-rvm'

# Use the Unicorn app server
gem 'fog'

# solr fulltext search
gem 'sunspot_rails', '~> 1.3.0'  

group :development, :test do
  gem 'thin'
  # gem 'sqlite3'
  gem 'mysql2'  
  gem 'sunspot_solr'
  gem 'railroady'
  gem "rails-erd"
end

group :production do  
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'   
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'  
  gem 'less-rails'
  gem 'twitter-bootstrap-rails', "2.2.8" #:git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'bootstrap-addons-rails'  
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'debugger'

# Refinery CMS
gem 'refinerycms', '~> 2.1.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', '~> 1.0.0'
#  gem 'refinerycms-blog', '~> 2.1.0'
#  gem 'refinerycms-inquiries', '~> 2.1.0'
#  gem 'refinerycms-search', '~> 2.1.0'
#  gem 'refinerycms-page-images', '~> 2.1.0'

gem 'refinerycms-courses', :path => 'vendor/extensions'
gem 'refinerycms-newsarticles', :path => 'vendor/extensions'
gem 'refinerycms-faqs', :path => 'vendor/extensions'

gem 'blueimp-gallery' # for video and image galleries
# gem 'will_paginate-bootstrap' # integrates will paginate and twitter bootstrap
gem 'bootstrap-will_paginate'