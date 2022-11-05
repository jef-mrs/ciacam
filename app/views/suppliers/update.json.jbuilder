if @supplier.save
  json.inserted_item json.partial!('suppliers/update_supplier.html.erb', supplier: @supplier)
  json.info json.partial!('suppliers/info_supplier.html.erb', supplier: @supplier)
else
  json.error json.partial!('suppliers/error.html.erb')
end
