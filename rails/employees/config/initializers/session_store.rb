# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_employees_session',
  :secret      => '5763add47f58d68735dacf93c325ef913693d021b7e967fb69eaf80448a7a389d82d935d65205c7c56af90ad29d2247760fc8fae2bb31a14182c5c45d8b06d4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
