source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Core
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'jsonapi-resources', '~> 0.8.3'

# Data store
gem 'pg', '~> 0.18'
gem 'chewy', '~> 0.8.4'
gem 'redis-rails', '~> 5.0'
gem 'connection_pool', '~> 2.2.1'

# Optimization
gem 'oj', '~> 2.18.2'
gem 'oj_mimic_json', '~> 1.0.1'

# Authenticate & Security
gem 'rolify', '~> 5.1.0'
gem 'pundit', '~> 1.1.0'
gem 'bcrypt', '~> 3.1.7'
gem 'doorkeeper', '~> 4.2.5'
gem 'jsonapi-authorization', '~> 0.8.2'

# ActiveRecord plugin
gem 'paranoia', '~> 2.2'
gem 'friendly_id', '~> 5.1.0'
gem 'mini_magick', '~> 4.5.1'
gem 'carrierwave', '~> 0.11.2'

# Video storage
gem 'google-api-client', '~> 0.9'

# Middleware
gem 'rack-cors', '~> 0.4.1'

# Background tasks
gem 'sidekiq', '~> 4.2.9'

group :development, :test do
  # Better console
  gem 'pry-rails'

  # Schema annotate
  gem 'annotate'

  # Testing
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'faker'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
