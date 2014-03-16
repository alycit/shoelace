# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jessticular_cancer = User.create(name: "Jess", email: "jess@jess.com", gravatar: "http://www.gravatar.com/avatar/fa500c4b6e2696bd66133bf99855895c.png", cohort_id: 1)
mandrew = User.create(name: "Andrew", email: "andrew@andrew.com", cohort_id: 1)
scarah = User.create(name: "Sarah", email: "sarah@sarah.com", cohort_id: 2)
marco_polo = User.create(name: "Marco", email: "marco@marco.com", cohort_id: 2)


appointment_1 = Appointment.create(start_time: Time.now, end_time: Time.now, mentor_id: 1, mentee_id: 3)
appointment_2 = Appointment.create(start_time: Time.now, end_time: Time.now, mentor_id: 2, mentee_id: 4)
appointment_3 = Appointment.create(start_time: Time.now, end_time: Time.now, mentor_id: 2, mentee_id: 1)
