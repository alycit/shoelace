class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
  end


  private
  def appt_params
    params.require(:appointment).permit(:start_time, :mentor_id, :mentee_id)
  end

end
