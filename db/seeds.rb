require 'faker'

puts "Destroying all datas..."
Booking.destroy_all
Double.destroy_all
User.destroy_all

puts "All datas destroyed !"

country = %w(France Spain Italy Germany Greece)

puts "Creating Users..."

User.create(first_name: "Loris",
            last_name: "Reynaud",
            email: "loris.reynaud@gmail.com",
            password: "azerty",
            address: "148 rue de Rome Marseille",
            country: "France")

u = 1
6.times do
  user = User.new(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: "azerty",
                  address: Faker::Address.street_address + Faker::Address.city,
                  country: country.sample
                  )
  user.save!
  puts "Users created : #{u}"
  u += 1
end

puts "Users finished !"
puts " "
puts "Creating Lookalikes..."

d = 1
20.times do
  double = Double.new(user_id: User.all.sample.id,
                      name: Faker::FunnyName.name,
                      description: Faker::Lorem.paragraphs,
                      city: Faker::Address.city,
                      country: country.sample,
                      price_per_day: rand(40..650),
                      available: Faker::Boolean.boolean(true_ratio: 0.7)
                      )
  double.save!
  puts "Lookalikes created : #{d}"
  d += 1
end
puts "Lookalikes finished !"
puts ""
puts "Creating Bookings..."

arrival = Faker::Date.between(from: '2022-01-29', to: '2022-03-16')
status = %w(Pending Accepted Rejected)
b = 1
30.times do
  booking = Booking.new(user_id: User.all.sample.id,
                        double_id: Double.all.sample.id,
                        arrival_date: arrival,
                        departure_date: arrival + rand(0..7),
                        total_price: rand(40..2000),
                        number_of_days: rand(1..7),
                        status: status.sample)
  booking.save!
  puts "Bookings created : #{b}"
  b += 1
end
puts "Bookings finished !"
puts "SEEDS TERMINATED ! CONGRATS !"
