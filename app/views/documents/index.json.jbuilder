json.index json.partial!('documents/index.html.erb', documents: @supplier_documents,
                                                     analyse_bios: @analyse_bios,
                                                     supplier: @supplier)
