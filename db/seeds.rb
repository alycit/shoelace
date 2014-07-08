60.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.safe_email, description: Faker::Lorem.sentence)
end

saturday = Appointment.coming_saturday

users = User.all.sort

15.times do
  Appointment.create(start_time: DateTime.new(saturday.year, saturday.month, saturday.day, rand(9..20), [0, 30].sample), mentor_id: rand(users[0].id..users[-1].id), mentee_id: [nil, users[0].id..users[-1].id].sample, appt_type: "mentor")
end

3.times do
  Appointment.create(start_time: DateTime.new(saturday.year, saturday.month, saturday.day, rand(9..20), [0, 30].sample), mentor_id: rand(users[0].id..users[-1].id), appt_type: "event", description: Faker::Lorem.sentence)
end