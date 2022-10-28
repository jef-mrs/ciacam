if @supplier.persisted?
  # json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.inserted_item json.partial!("suppliers/new_supplier.html.erb", supplier: @supplier)
else
  # json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.error json.partial!("suppliers/error.html.erb")
end
