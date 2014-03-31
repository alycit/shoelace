60.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.safe_email)
end

saturday = Appointment.saturday

15.times do
  Appointment.create(start_time: DateTime.new(saturday.year, saturday.month, saturday.day, rand(9..20), [0, 30].sample), mentor_id: rand(1..60), mentee_id: [nil, rand(1..60)].sample)
end
