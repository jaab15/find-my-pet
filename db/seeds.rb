# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pet_type = ['Dog', 'Cat', 'Bird', 'Guinea Pig', 'Hamster', 'Iguana', 'Snake', 'Other']

size = ['Small', 'Medium', 'Big']

gender = ['Male', 'Female']

50.times do |i|
 Pet.create(name: Faker::Name.name,
           breed: Faker::Name.first_name,
           color: Faker::Color.color_name,
           gender: gender.sample,
           age:  (1+Random.rand(10)),
           address: Faker::Address.city,
           last_seen_date: Faker::Date.forward(30),
           last_seen_time: Faker::Time.backward(30, :all),
           note: Faker::Lorem.paragraph,
           lat: rand(49.1...49.3),
           long: rand(-123.2...-122.0),
           pet_type: pet_type.sample,
           size: size.sample)
end

100.times do |i|
 pet = Pet.friendly.find(Random.rand(1..Pet.count))
 Sighting.create(name: Faker::Name.name,
           address: Faker::Address.city,
           last_seen_date: Faker::Date.forward(30),
           last_seen_time: Faker::Time.backward(30, :all),
           pet_type: pet.pet_type,
           note: Faker::Lorem.paragraph,
           lat: rand(49.1...49.3),
           long: rand(-123.2...-122.0),
           pet_id: pet.id,
           last_seen_time: Faker::Time.between(2.days.ago, Date.today, :all)
           )
end

10.times do |i|
      User.create(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email,
                   password: '123',
                   password_confirmation: '123'
                   )
end
