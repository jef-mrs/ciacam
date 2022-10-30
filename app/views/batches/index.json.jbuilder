json.index json.partial!("batches/index.html.erb", batchs: @batchs, batch: Batch.new)
json.card json.partial!("batches/card_batch.html.erb", batchs: @batchs)
