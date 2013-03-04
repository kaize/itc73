json.items @lists do |json, list|
  json.original_id list.original_id
  json.name list.name
  json.items_count list.items_count
end
