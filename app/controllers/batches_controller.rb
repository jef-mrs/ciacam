class BatchesController < ApplicationController
  def index
    @batchs = policy_scope(Batch)

    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  def create
    @batchs = policy_scope(Batch)
    @batch = Batch.create(batch_params)
    authorize @batch
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:number, :quantity, :transportation, :product_id, :supplier_id)
  end
end
