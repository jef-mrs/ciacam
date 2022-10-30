json.index json.partial!("suppliers/index.html.erb", suppliers: @suppliers, supplier: Supplier.new)
json.card json.partial!("suppliers/card_supplier.html.erb", suppliers: @suppliers)
