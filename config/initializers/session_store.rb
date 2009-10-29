# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blueprint_session',
  :secret      => 'afb517b3d97f907a7dbde4231d11a739325c1eb5eb24de28ce0abe36ef81919daa03d376c957d3206e72de1d6a867ebc27603459704e7068962e7194d8b3dda8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
