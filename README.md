# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 3.0.6

* Rails - 7.1.3

* Model Design
User          -   id, email, password, first_name, last_name, phone_number, location
Hotel         -   id, name, location, owner, status
Room          -   id, room_no, hotel_id, room_category_id
RoomCategory  -   id, name, capacity, price, facilities
Booking       -   id, hotel_id, user_id, check_in, check_out, balance_amount, status
Transaction   -   id, amount
Payment       -   id, booking_id, transaction_id

User:
 - has_many :bookings

Hotel:
 - has_many :rooms
 - has_many :bookings

Room:
 - belongs_to :hotel
 - has_one :room_category
 - has_and_belongs_to_many :bookings

RoomCategory:
 - room_full_data

Booking:
 - belongs_to :hotel
 - belongs_to :user
 - has_many :payments
 - has_many :transactions, through: :payments
 - has_and_belongs_to_many :rooms

BookingRoom:
 - booking_id, room_id

Transaction:
 - has_many :payments
 - has_many :bookings, through: :payments

Payment:
 - belongs_to :booking
 - belongs_to :transaction

## How does this application works?
 - Login with Customer role user
 - Find Hotels by providing location, no_of_rooms, check_in, check_out information
 - Select your preferable hotel from find hotels search result and start booking
 - Select your preferable rooms and submit create booking
 - Refer your bookings from My bookings section from the left menu where it displays BOOKED/ CANCELLED/COMPLETED/ARCHIVED bookings.
 - Customer can cancel their booking.

# seed data
Roll.new(name: "Admin").save
Roll.new(name: "Customer").save

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

hote14 = Hotel.new(
  name: "Trident",
  location: "Chennai",
  owner: "TG Rajan",
  status: true
)
hotel4.save
