if params[:supplier_id]
  json.index json.partial!('documents/index.html.erb', documents: @documents,
                                                       analyse_bios: @analyse_bios,
                                                       supplier: @supplier)
end

json.index json.partial!('documents/index.html.erb', product: @product, documents: @documents,) if params[:product_id]
