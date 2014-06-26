module SessionsHelper

  def authenticated?
    session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def token_as_hash(token)
    { token: token.token,
      refresh_token: token.refresh_token,
      expires_at: token.expires_at }
  end

  def check_session
    unless authenticated?
      redirect_to :root
    end
  end

end
