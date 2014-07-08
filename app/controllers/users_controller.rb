class UsersController < ApplicationController
  before_filter :check_session

  def show
    @user = User.find(params[:id])
    @filled_availabilities = @user.filled_appointments_for_saturday
    @open_availabilities = @user.open_appointments_for_saturday
    @booked_mentoring = @user.sessions_for_saturday
    @workshops = @user.workshops_for_saturday
  end

  def update
    current_user.description = params[:description]
    current_user.save
    respond_to do |format|
      format.json { render :json => current_user }
    end
  end
end