json.extract! hotel, :id, :name, :location, :owner, :status, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
