if @batch.persisted?
  # json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.inserted_item json.partial!("batches/new_batch.html.erb", batch: @batch)
else
  # json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
  json.error json.partial!("batches/error.html.erb")
end
