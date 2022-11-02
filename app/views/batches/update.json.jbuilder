if @batch.save!
  json.inserted_item json.partial!('batches/update_batch.html.erb')
  json.number json.partial!('batches/info_batch_number.html.erb', batch: @batch)
  json.info json.partial!("batches/info_batch.html.erb", batch: @batch)
else
  json.error json.partial!('batches/error.html.erb')
end
