$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_full/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_full"
  s.version     = CatarseFull::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CatarseFull."
  s.description = "TODO: Description of CatarseFull."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  # s.add_dependency "jquery-rails"

  [
    'pg',
    'rspec-rails',
    'capybara',
    'factory_girl_rails',
    'byebug',
    'guard-rspec'
  ].each do |gem|
    s.add_development_dependency gem
  end
end
