$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_full/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_full"
  s.version     = CatarseFull::VERSION
  s.authors     = ["Marnen Laibow-Koser"]
  s.email       = ["marnen@marnen.org"]
  s.homepage    = "TODO"

  s.summary     = "TODO: Summary of CatarseFull."
  s.description = "TODO: Description of CatarseFull."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  [
    # We got some weird bug concerning encoding of AR objects in rails 3.2.13+
    ['rails', '3.2.13'],
    ['mail', '2.5.3'],
    ['sidekiq', '~> 2.13.0'],
    'sinatra', # require: false # required by sidekiq web interface mounted on /sidekiq

    # Turns every field on a editable one
    'best_in_place',

    # State machine for attributes on models
    'state_machine', # require: 'state_machine/core'

    # paranoid stuff
    ['paper_trail', '~> 2.7.2'],

    # Database and data related
    'pg',
    'pg_search',
    ['postgres-copy', '~> 0.6.0'],
    'schema_plus',
    'schema_associations',
    'chartkick',

    # Payment engine using Paypal
    ['catarse_paypal_express', '~> 1.0.0'],

    # Payment engine using Moip
    ['catarse_moip', '~> 1.0.9'],
    #gem 'catarse_moip', path: '../catarse_moip'


    # Decorators
    'draper',

    # Frontend stuff
    ['slim-rails', '~> 1.1.1'],
    'jquery-rails',

    # Authentication and Authorization
    'omniauth',
    'omniauth-twitter',
    ['omniauth-facebook', '1.4.0'],
    'devise',
    'ezcrypto',

    # See https://github.com/ryanb/cancan/tree/2.0 for help about this
    # In resume: this version of cancan allow checking for authorization on specific fields on the model
    ['marnen-cancan', '= 2.0.0.alpha.pre.f1cebde51a87be149b4970a3287826bb63c0ac0b'],

    # Email marketing
    ['marnen-catarse_mailchimp', '= 0.0.1.pre.2ed4f3931dfa292e5c1c62619772f04e41c68629z'],

    # HTML manipulation and formatting
    ['formtastic', '~> 2.2.1'],
    ["auto_html",    '= 1.4.2'],
    'kaminari',

    # Uploads
    ['carrierwave', '~> 0.8.0'],
    'rmagick',

    # Other Tools
    'ranked-model',
    ['feedzirra', '>= 0.0.24', '< 0.8'],
    ['marnen-validation_reflection', '= 1.0.0.60320e6beb088808fd625a8d958dbd0d2661d494'], # based on ncri/validation_reflection
    ['inherited_resources', '1.3.1'],
    'has_scope',
    'spectator-validates_email', # require: 'validates_email'
    ['video_info', '>= 1.1.1', '< 1.6'],
    'enumerate_it',
    'httparty',

    # Translations
    'http_accept_language',
    'routing-filter',

    # Payment
    ['marnen-moip', '= 1.0.2.pre.39f9dab38fc33fe9bf614deb8e90ca166ab2d6bf'],
    ['activemerchant', '>= 1.17.0'], # require: 'active_merchant'
    ['httpclient', '>= 2.2.5']
  ].each do |gem|
    s.add_dependency *gem
  end

  # Production group
  [
    'google-analytics-rails',
    ['fog', '>= 1.3.1'],
    'unicorn',
    ['newrelic_rpm', '3.6.5.130'],

    # Enabling Gzip on Heroku
    # Not necessary on other hosts.
    # ['heroku-deflater', '>= 0.4.1'],

    # Using dalli and memcachier have not presented significative performance gains
    # Probably this is due to our pattern of cache usage
    # + the lack of concurrent procs in our deploy
    #gem 'memcachier'
    #gem 'dalli'
  ].each do |gem|
    s.add_dependency *gem
  end

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
