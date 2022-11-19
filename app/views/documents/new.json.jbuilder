if params[:supplier_id]
  json.form json.partial!('documents/form.html.erb', document: @document, supplier: @supplier)
  json.analyse_form json.partial!('analyse_supp_docs/form.html.erb', analyse_doc: @analyse_doc, supplier: @supplier)
end

json.form json.partial!('documents/form.html.erb', document: @document, product: @product) if params[:product_id]

json.form json.partial!('documents/form.html.erb', document: @document, batch: @batch) if params[:batch_id]
