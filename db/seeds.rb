60.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.safe_email, description: Faker::Lorem.sentence)
end

saturday = Appointment.coming_saturday

25.times do
  Appointment.create(start_time: DateTime.new(saturday.year, saturday.month, saturday.day, rand(9..20), [0, 30].sample), mentor_id: rand(1..60), mentee_id: [nil, rand(1..60)].sample, appt_type: ["mentor", "mentor", "mentor", "mentor", "event"].sample)
end

Appointment.all.each do |appointment|
  if appointment.appt_type == "event"
    appointment.description = Faker::Lorem.sentence
    appointment.save
  end
end
