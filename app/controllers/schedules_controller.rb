class SchedulesController < ApplicationController
  include ApplicationHelper
  def index
    @saturday = Appointment.saturday
    @schedule = []

    time = Time.new(@saturday.year, @saturday.month, @saturday.day, 9, 0, 0)
    header_row = ["Time"].concat(User.get_mentors_with_saturday_appointments)

    @schedule << header_row

    24.times do |i|
      row = []
      appointments = Appointment.get_saturday_appointments_by_timeslot(time)

      header_row.each do |cell|
        if cell.is_a? User
          appointment = appointments.find { |appointment| appointment.mentor.name == cell.name }
          if appointment
            row << appointment
          else
            row << nil
          end
        else
          row << time
        end
      end

      @schedule[i+1] = row

      time += 30.minutes
    end
  end
end
