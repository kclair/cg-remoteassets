# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cg-remoteassets_session',
  :secret      => 'c1f9da836d54fba5e23c695353a7c962b7feb4bb27683f3b3937363827af55cd8407dc455dc10635f3c475f065eb9960808751481b802e848713191b649f388e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
