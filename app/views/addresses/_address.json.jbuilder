json.extract! address, :id, :line1, :line2, :city, :state, :zip, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)
