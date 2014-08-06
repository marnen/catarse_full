source 'https://rubygems.org'

# Declare your gem's dependencies in catarse_full.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# For heroku
ruby '2.0.0'
# Papertrail does not work with rails 3.2.12 + ruby 2.0.0
# https://github.com/airblade/paper_trail/issues/208

# We got some weird bug concerning encoding of AR objects in rails 3.2.13+

group :development do
  gem "letter_opener"
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
  # Uncomment only for optimization, should be commented on master branch
  # gem 'rack-mini-profiler'
end

group :test, :development do
  gem 'rspec-rails'
  gem "pry"
end

group :test do
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capybara',   '~> 2.0.2'
  gem 'jasmine'
  gem 'coveralls', require: false
  gem "selenium-webdriver", "~> 2.34"
end