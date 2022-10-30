json.index json.partial!("products/index.html.erb", products: @products, product: Product.new)
json.card json.partial!("products/card_product.html.erb", products: @products)
