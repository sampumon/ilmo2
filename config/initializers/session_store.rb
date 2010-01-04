# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ilmo2_session',
  :secret      => 'f58d67101ba1921d657181c66fef98c0ef60657a5fe958947b43398a4a95cdc9de492efe016d324e1fbe7500d03b924cc103b3549f36025607de9846a8a56287'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
