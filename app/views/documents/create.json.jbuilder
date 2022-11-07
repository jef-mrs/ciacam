if @document.persisted?
  json.inserted_item json.partial!('documents/inserted_item.html.erb')
else
  json.error json.partial!('documents/error.html.erb')
end
