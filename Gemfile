source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Postgres
gem 'pg', '~> 0.18.4'
# Puma server
gem 'puma', '~> 2.16.0'
# Authentication
gem 'devise', '~> 3.5.6'
# Authorization
gem 'cancancan', '~> 1.10'
# Search
gem 'ransack', github: 'activerecord-hackery/ransack'
# Image management
gem 'paperclip', '~> 4.3.5'
# Rails Admin
gem 'rails_admin', '~> 0.8.1'
# For cross-origin ajax requests
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'faker', '~> 1.4.3'
  gem 'byebug'        # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'spring'        # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

group :development do
  gem 'web-console'   # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'habtm_generator'
end

group :production do
  gem 'rails_12factor'
end
