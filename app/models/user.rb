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

  def self.get_mentor_names_with_saturday_appointments
    users = User.joins(:appointments).where(appointments: {start_time: Appointment.saturday.beginning_of_day..Appointment.saturday.end_of_day }).uniq.order(:name)
    users.map { |user| user.name }
  end
end
