if @product.persisted?
  json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.inserted_item json.partial!("products/new_product.html.erb", product: Product.last)
else
  json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.inserted_item json.partial!("products/error.html.erb")
end
