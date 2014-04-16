# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IQHomes_session',
  :secret      => '95219396373e9038983d608ed947f266834ff1a4b52568cf1c51b60950783e6f4cd69295ab3ffe77b55d280bcd08e6a1a344e96460d819c2311c4b3639c3e10b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
