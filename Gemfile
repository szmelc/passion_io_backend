source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'

gem 'devise'
gem 'doorkeeper'
gem 'faker'
gem 'grape'
gem 'grape-active_model_serializers'
gem 'grape-kaminari'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'kaminari-grape'
gem 'pundit'
gem 'rack-cors'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
