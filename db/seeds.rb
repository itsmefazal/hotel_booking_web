# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Seeding Data started ......"
Role.new(name: "Admin").save
Role.new(name: "Customer").save

u1 = User.new(email: "admin@booking.com", first_name: "Steve", last_name: "Stephen", password: "Abcd@123")
u1.save

u1.roles << Role.where(name: "Admin").first
u1 = User.new(email: "customer@booking.com", first_name: "Chris", last_name: "Adams", password: "Abcd@123")
u1.save
u1.roles << Role.where(name: "Customer").first

RoomCategory.create(
  name: "Single Room",
  capacity: 1,
  price: 1000.0,
  facilities: "AC - NO, Breakfast - NO, Laundry - NO, Geyser - NO"
)

RoomCategory.create(
  name: "Standard",
  capacity: 2,
  price: 1500.0,
  facilities: "AC - YES, Breakfast - NO, Laundry - NO, Geyser - NO"
)

RoomCategory.create(
  name: "Deluxe",
  capacity: 4,
  price: 2500.0,
  facilities: "AC - YES, Breakfast - YES, Laundry - NO, Geyser - YES"
)

RoomCategory.create(
  name: "Premium Suite",
  capacity: 6,
  price: 3500.0,
  facilities: "AC - YES, Breakfast - YES, Laundry - YES, Geyser - YES"
)

RoomCategory.create(
  name: "PentHouse Suite",
  capacity: 5,
  price: 4000.0,
  facilities: "AC - YES, Breakfast - NO, Laundry - NO, Geyser - YES"
)

hotel1 = Hotel.new(name: "Hotel Omega ",
  location: "Bangalore",
  owner: "Vijay Singh",
  status: true
)
hotel1.save
hotel1.rooms.create(room_no: "101", room_category_id: 1)
hotel1.rooms.create(room_no: "102", room_category_id: 2)
hotel1.rooms.create(room_no: "103", room_category_id: 3)
hotel1.rooms.create(room_no: "104", room_category_id: 1)
hotel1.rooms.create(room_no: "105", room_category_id: 4)
hotel1.rooms.create(room_no: "106", room_category_id: 5)
hotel1.rooms.create(room_no: "107", room_category_id: 3)
hotel1.rooms.create(room_no: "108", room_category_id: 2)
hotel1.rooms.create(room_no: "101", room_category_id: 4)
hotel1.rooms.create(room_no: "102", room_category_id: 2)

hotel2 = Hotel.new(
  name: "Hotel Orion",
  location: "Hyderabad",
  owner: "Orion",
  status: true
)
hotel2.save
hotel2.rooms.create(room_no: "201", room_category_id: 1)
hotel2.rooms.create(room_no: "202", room_category_id: 2)
hotel2.rooms.create(room_no: "203", room_category_id: 3)
hotel2.rooms.create(room_no: "204", room_category_id: 1)
hotel2.rooms.create(room_no: "205", room_category_id: 4)

hotel3 = Hotel.new(
  name: "BR Residency",
  location: "Hyderabad",
  owner: "Bheema Reddy",
  status: true
)
hotel3.save

hotel4 = Hotel.new(
  name: "Trident",
  location: "Chennai",
  owner: "TG Rajan",
  status: true
)
hotel4.save

puts "Seeding Data Completed ......"
