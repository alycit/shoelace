class Appointment < ActiveRecord::Base
  belongs_to :mentor, class_name: "User"
  belongs_to :mentee, class_name: "User"

  def self.get_saturday_appointments_by_timeslot(time)
    Appointment.where(:start_time => time-5.hours)
  end

  def self.saturday
    date = Time.now
    date.wday == 6 ? date : date + (6 - date.wday).days
  end
end
