source 'https://rubygems.org'

ruby '3.2.0'
gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Pagination
gem 'kaminari'

# Text search
gem 'pg_search'

group :development, :test do
  gem 'byebug'
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-capybara'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'launchy'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'web-console'
end

gem 'http_accept_language', '~> 2.1'

gem "dockerfile-rails", ">= 1.6", :group => :development
