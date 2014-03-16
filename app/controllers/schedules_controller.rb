class SchedulesController < ApplicationController

  def index
    @appointments = Appointment.get_saturday_appointments
  end
end
