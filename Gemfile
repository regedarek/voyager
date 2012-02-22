source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'haml-rails'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'factory_girl_rails'

  gem 'launchy'

  group :autotest do 
    gem 'ZenTest'
    gem 'autotest'
    gem 'autotest-rails'
  end
end

group :development do
  gem 'populator'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

# Authentication
gem 'sorcery'
gem 'recaptcha', :require => "recaptcha/rails"

gem 'therubyracer'
gem 'execjs'
