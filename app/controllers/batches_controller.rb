class BatchesController < ApplicationController
  def index
    @batchs = policy_scope(Batch).sort_by { |e| -e.number }

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

  def edit
    @batch = Batch.find(params[:id])
    authorize @batch
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a edit.json view
    end
  end

  def update
    @batchs = policy_scope(Batch)
    @batch = Batch.find(params[:id])
    @batch.update(batch_params)
    authorize @batch
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a update.json view
    end
  end

  private

  def batch_params
    params.require(:batch).permit(:number, :quantity, :transportation, :product_id, :supplier_id, :discharge_place,
                                  :bank, :status, :origin, :info, :rich_info)
  end
end
