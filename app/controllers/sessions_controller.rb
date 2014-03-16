class SessionsController < ApplicationController
  include SessionsHelper

  def sign_in
    redirect_to '/auth/dbc'
  end

  def sign_out
    session.clear
    redirect_to root_path
  end

  def auth
    @user =  User.create_or_find_user_from_oauth(request.env['omniauth.auth'].info)
    session[:user_id] = @user.id
    token = request.env['omniauth.auth'].credentials
    session[:oauth_token] = token_as_hash(token)
    redirect_to schedule_path
  end

end
