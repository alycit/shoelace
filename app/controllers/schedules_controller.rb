class SchedulesController < ApplicationController
  include ApplicationHelper
  def index
    @appointments = Appointment.get_saturday_appointments
    @mentors = []
    @appointments.each do |appt|
      unless @mentors.include?(appt.mentor)
        @mentors << appt.mentor
      end
    end
    @saturday = Appointment.saturday
    @times = []
    time = Time.new(@saturday.year, @saturday.month, @saturday.day, 9, 0, 0)
    24.times do
      @times << time
      time += 30.minutes
    end
  end
end
