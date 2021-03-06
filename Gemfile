source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
# `bundle install` and restart your server to make the files available through the pipeline.
ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

# Use bootstrap for frontend-UI layout
# gem 'bootstrap', '~> 4.5', '>= 4.5.2'
#  jquery for bootstrap
# gem 'jquery-rails'
# Use font awesome for adding icons
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'

# Use hirb for better database table display in console
gem 'hirb', '~> 0.7.3'

# Use Devise for user authentication
gem 'devise', '~> 4.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'

# Use Stripe for payment processing
gem 'stripe', '~> 5.25'

# Use figaro for ENV variables
gem 'figaro', '~> 1.2'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
# gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop', '~>0.81.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.

  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
