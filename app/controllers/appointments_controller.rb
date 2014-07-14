class AppointmentsController < ApplicationController
  before_filter :check_session

  def new
    @appointment = Appointment.new
  end

  def create
    user = User.find(session[:user_id])
    description = params[:event_desc]

    if description.empty?
      description = nil
    end

    start_time = extract_start_time(params[:start_time])

    logger.info "Start time of appt: #{start_time}"

    user.appointments << Appointment.create(start_time: start_time, appt_type: params[:appt_type], description: description)
    redirect_to "/schedule"
  end

  def destroy
    Appointment.find(params[:id]).destroy
    if params[:from]
      redirect_to user_path(current_user)
    else
      redirect_to "/schedule"
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    appointment.mentee_id = nil if params[:type] == "cancel"
    appointment.mentee_id = session[:user_id] if params[:type] == "book"

    appointment.save

    if params[:from]
      redirect_to user_path(current_user)
    else
      redirect_to "/schedule"
    end
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
