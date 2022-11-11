if @analyse_supp.persisted?
  json.inserted_item json.partial!('analyse_supp_docs/inserted_item.html.erb')
else
  json.error json.partial!('analyse_supp_docs/error.html.erb')
end
