json.items @lists do |json, list|
  json.id list.id
  json.name list.name
  json.items_count list.items_count
end
