json.extract! room, :id, :room_no, :hotel_id, :room_category_id, :created_at, :updated_at
json.url room_url(room, format: :json)
