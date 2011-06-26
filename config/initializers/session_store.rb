# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cyclemaintenance_session',
  :secret      => 'ff6132fffec21c59fdbbec78d461ae44574264e362ba69ee01b51afb773097fbafe67efa02c481a1c666df15d2cbf788c7e75ee1195a94afd4fa5be90e535621'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
