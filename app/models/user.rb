class User < ActiveRecord::Base
  has_many :appointments, foreign_key: :mentor_id
  has_many :mentees, through: :appointments

  has_many :sessions, class_name: "Appointment", foreign_key: :mentee_id
  has_many :mentors, through: :sessions

  def self.create_or_find_user_from_oauth(oauth_hash)
    user = self.find_by_email(oauth_hash.email)
    unless user
      user = self.create(name: oauth_hash.name,
                         gravatar: oauth_hash.gravatar,
                         email: oauth_hash.email)
    end
    user
  end

  def self.get_mentors_with_saturday_appointments
    User.joins(:appointments).where(appointments: {start_time: Appointment.coming_saturday.beginning_of_day..Appointment.coming_saturday.end_of_day }).uniq.order(:name)
  end

  def sessions_for_saturday
    sessions.where(appt_type: "mentor", start_time: Appointment.coming_saturday.beginning_of_day..Appointment.coming_saturday.end_of_day)
  end

  def open_appointments_for_saturday
    appointments.where(appt_type: "mentor", mentee_id: nil, start_time: Appointment.coming_saturday.beginning_of_day..Appointment.coming_saturday.end_of_day)
  end

  def filled_appointments_for_saturday
    appointments.joins(:mentee).where(appt_type: "mentor", start_time: Appointment.coming_saturday.beginning_of_day..Appointment.coming_saturday.end_of_day)
  end

  def workshops_for_saturday
    appointments.where(appt_type: "event", start_time: Appointment.coming_saturday.beginning_of_day..Appointment.coming_saturday.end_of_day)
  end
end
