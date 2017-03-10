Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    # TODO: not sure if needed
  end

  resource_owner_from_credentials do
    # TODO: add user authentication logic
  end

  admin_authenticator do
    # TODO: add admin authentication logic
  end

  reuse_access_token
  use_refresh_token
  access_token_expires_in 30.days
  grant_flows %w(authorization_code client_credentials password)
  realm 'BakaAni'
end

Doorkeeper::AccessToken.class_eval do
  belongs_to :resource_owner, class_name: 'User'
end
