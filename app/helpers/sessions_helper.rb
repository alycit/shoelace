module SessionsHelper

  def authenticated?
    session[:user_attributes]
  end

  def token_as_hash(token)
    { token: token.token,
      refresh_token: token.refresh_token,
      expires_at: token.expires_at }
  end

end
