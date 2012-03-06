source 'http://rubygems.org'

# Restricted gems
gem 'rails', '3.1.1'
gem 'pg'
gem 'heroku'
gem 'therubyracer'
gem 'execjs'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'

# Form builder
gem 'simple_form'
gem 'country_select'

# Private Messages
gem 'acts-as-messageable'

# Forum
gem 'forem', :git => "git://github.com/regedarek/forem.git"

# Authentication
gem 'sorcery'
gem 'recaptcha', :require => "recaptcha/rails"

# Authorization
gem 'cancan'

# Tests gems
group :development, :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'turn', :require => false
  gem 'launchy'
  gem 'spork', '~> 1.0rc'
  gem 'libnotify'
  gem 'guard', '>= 1.0.0'
  gem "guard-rspec"
  gem 'guard-spork'
  gem 'hpricot'
  gem 'ZenTest'
  gem 'autotest'
  gem 'autotest-rails'
end

group :test do
  gem 'shoulda'
end

group :development do
  gem 'populator'
end
