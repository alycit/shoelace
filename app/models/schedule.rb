class Schedule
  def self.calendar_for(mentors)
    header_row = ["Time"].concat(mentors)

    schedule = []
    schedule << header_row

    saturday = Appointment.coming_saturday
    time = Time.new(saturday.year, saturday.month, saturday.day, 9, 0, 0)

    24.times do |i|
      row = []
      appointments = Appointment.get_saturday_appointments_by_timeslot(time)

      header_row.each_with_index do |cell, index|
        unless index == 0
          row << appointments.find { |appointment| appointment.mentor == cell }
        else
          row << time
        end
      end

      schedule[i+1] = row

      time += 30.minutes
    end
    schedule
  end
end
