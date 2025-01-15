source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.8", ">= 7.0.8.7"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  gem 'pg'
end

gem "image_processing", "~> 1.2"
gem 'mini_magick'
gem 'devise'
gem "jsbundling-rails", "~> 1.3"
gem 'kaminari'
gem 'webpacker'
gem 'carrierwave'
gem 'sidekiq'
gem 'sassc'
gem 'will_paginate', '~> 3.3'

