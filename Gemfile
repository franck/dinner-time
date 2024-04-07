source "https://rubygems.org"

ruby "3.2.0"
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Pagination
gem 'kaminari'

# Text search
gem 'pg_search'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'database_cleaner-active_record'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'byebug'
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end
