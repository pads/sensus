source 'https://rubygems.org'

gem 'bundler'
gem 'hanami',       '~> 0.9'
gem 'hanami-model', '~> 0.7'
gem 'rake'

gem 'pg'

group :development do
  gem 'pry-byebug'
  gem 'rubocop', require: false
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'bundler-audit', require: false
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'minitest'
end

group :production do
  gem 'puma'
end
