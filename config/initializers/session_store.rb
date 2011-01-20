# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_epoch_session',
  :secret      => '94f277209e3fb050966ca6f98a74ab1a0325432aa5d1dd757121d204e89d55cf404b4df025a35f4885fb7e06f087f16f1b432dbba7b7651f56dff04a31d2643f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
