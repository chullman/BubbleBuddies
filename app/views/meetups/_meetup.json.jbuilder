json.extract! meetup, :id, :name, :description, :is_commercial_trip, :street_address, :city, :state, :country, :is_boat_required, :price, :member_limit, :date, :latitude, :longitude, :created_at, :updated_at
json.url meetup_url(meetup, format: :json)
