require 'dispatcher'

# This is a bit of a smell, but is needed for local development. See...
# http://stackoverflow.com/questions/2278031/wrapping-class-method-via-alias-method-chain-in-plugin-for-redmine
Dispatcher.to_prepare do
  Configuration.extend LdapAuthentication::Configuration

  if Configuration.ldap_enabled?
    User.extend LdapAuthentication
  end
end
