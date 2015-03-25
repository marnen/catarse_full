# require File.expand_path('../boot', __FILE__)
# require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(assets: %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

# Load gem dependencies; see http://stackoverflow.com/a/21293071/109011
Gem.loaded_specs["catarse_full"].runtime_dependencies.each do |d|
  begin
    # Format: {gem_name => require_as}
    mappings = {
      'compass-960-plugin' => false,
      'rmagick' => 'RMagick',
      'spectator-validates_email' => 'validates_email'
    }
    gem_to_require = mappings.has_key?(d.name) ? mappings[d.name] : d.name.gsub(%r{\Amarnen-}, '')
    require gem_to_require if gem_to_require
  # rescue LoadError => le
  #   # Put exceptions here.
  #   raise le if d.name !~ /factory_girl_rails/
  end
end

module Catarse
  class Engine < ::Rails::Engine
    config.to_prepare do
      Devise::Mailer.layout "email" # email.haml or email.erb
    end

    #NOTE: the custom view path is for build a new style without need to
    # edit the catarse_views
    config.paths['app/views'].unshift(
      "#{Catarse::Engine.root}/app/views/custom",
      "#{Catarse::Engine.root}/app/views/catarse_bootstrap")

    config.active_record.schema_format = :sql

    # Since Rails 3.1, all folders inside app/ will be loaded automatically
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/**)

    # Default encoding for the server
    config.encoding = "utf-8"

    initializer 'filter_parameters' do |app|
      app.config.filter_parameters += [:password, :password_confirmation]
    end

    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.test_framework :rspec, fixture: false, views: false
    end
    config.active_record.observers = [
      :backer_observer, :user_observer, :notification_observer,
      :update_observer, :project_observer, :payment_notification_observer
    ]

    # See http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/ .
    # Rails 4 syntax will be different.
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        app.config.paths["db/migrate"] += config.paths["db/migrate"].expanded
      end
    end

    initializer 'assets' do |app|
      config = app.config

      # Enable the asset pipeline
      config.assets.enabled = true

      # Don't initialize the app when compiling
      config.assets.initialize_on_precompile = false

      # Version of your assets, change this if you want to expire all your assets
      config.assets.version = '1.0'
    end
  end

  Application = Engine
end
