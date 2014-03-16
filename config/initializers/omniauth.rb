Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dbc, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']
end
