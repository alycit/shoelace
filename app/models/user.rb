class User < ActiveRecord::Base
  has_many :appointments, foreign_key: mentor_id
  has_many :mentees, through: :appointments

  has_many :sessions, class_name: "Appointment", foreign_key: :mentee_id
  has_many :mentors, through: :sessions
end
