json.items @lists do |json, list|
  json.extract! list, :original_id, :name, :items_count
end
