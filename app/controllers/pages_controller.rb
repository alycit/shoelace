class PagesController < ApplicationController

  def welcome
    if authenticated?
      redirect_to "/schedule"
    end
  end
end
