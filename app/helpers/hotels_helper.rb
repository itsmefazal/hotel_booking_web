module HotelsHelper
  def active_status(hotel)
    hotel.status ? "Active" : "Inactive"
  end
end
