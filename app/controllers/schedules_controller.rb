class SchedulesController < ApplicationController
  include ApplicationHelper
  def index
    @saturday = Appointment.coming_saturday
    @schedule = Schedule.calendar_for(User.get_mentor_names_with_saturday_appointments)
  end
end
