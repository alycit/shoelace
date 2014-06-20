class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    user = User.find(session[:user_id])
    user.appointments << Appointment.create(start_time: extract_start_time(params[:start_time]))
    redirect_to "/schedule"
  end

  private
  def appt_params
    params.require(:appointment).permit(:start_time, :mentor_id, :mentee_id)
  end

  def extract_start_time(time)
    appt_time = time.split(":")
    hour = appt_time[0].to_i - 5
    suffix = appt_time[1].split(" ")
    minute = suffix[0].to_i
    am_pm = suffix[1]
    hour = hour + 12 if am_pm == "PM"
    saturday = Appointment.coming_saturday
    Time.new(saturday.year, saturday.month, saturday.day, hour, minute)
  end

end
