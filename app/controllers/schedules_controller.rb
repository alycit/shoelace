class SchedulesController < ApplicationController
  include ApplicationHelper
  def index
    @saturday = Appointment.saturday
    @schedule = []

    time = Time.new(@saturday.year, @saturday.month, @saturday.day, 9, 0, 0)
    header_row = ["Time"].concat(User.get_mentor_names_with_saturday_appointments)

    @schedule << header_row

    24.times do |i|
      row = []
      appointments = Appointment.get_saturday_appointments_by_timeslot(time)

      header_row.each_with_index do |cell, index|
        unless index == 0
          row << appointments.find { |appointment| appointment.mentor.name == cell }
        else
          row << time
        end
      end

      @schedule[i+1] = row

      time += 30.minutes
    end
  end
end
