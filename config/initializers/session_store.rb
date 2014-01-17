# Be sure to restart your server when you modify this file.

Catarse::Application.initializer 'session_store' do |app|
  if Configuration[:base_domain]
    app.config.session_store :active_record_store, domain: Configuration[:base_domain]
  else
    app.config.session_store :active_record_store
  end
end

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# Catarse::Application.config.session_store :active_record_store

