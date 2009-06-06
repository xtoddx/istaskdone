# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_istaskdone_session',
  :secret      => '2db369ab286feb213ed298b2ee01dbcc53bfff2320bf4e838ba5c4032582e9b548f6653fd1af46d52118cec94657951ec64b3332cba5c22173faaa0c9ca9a3fa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
