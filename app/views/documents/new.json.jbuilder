json.form json.partial!('documents/form.html.erb', document: @document, supplier: @supplier)
json.analyse_form json.partial!('analyse_supp_docs/form.html.erb', analyse_doc: @analyse_doc, supplier: @supplier)
