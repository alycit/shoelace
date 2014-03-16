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
    session[:user_attributes] = request.env['omniauth.auth'].info
    token = request.env['omniauth.auth'].credentials
    session[:oauth_token] = token_as_hash(token)

    redirect_to root_path
  end

end
