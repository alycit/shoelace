class Appointment < ActiveRecord::Base
  belongs_to :mentor, class_name: "User"
  belongs_to :mentee, class_name: "User"

  def self.get_saturday_appointments
    Appointment.where(:start_time => saturday.beginning_of_day..saturday.end_of_day)
  end

  private

  def self.saturday
    date = Time.now
    date.wday == 6 ? date : date + (6 - date.wday).days
  end
end
