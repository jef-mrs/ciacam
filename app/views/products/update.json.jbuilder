if @product.save!
  json.inserted_item json.partial!("products/update_product.html.erb", product: @product)
  json.info json.partial!("products/info_product.html.erb", product: @product)
else
  json.error json.partial!("products/error.html.erb")
end
