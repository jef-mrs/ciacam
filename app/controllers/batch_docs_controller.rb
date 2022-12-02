class BatchDocsController < ApplicationController
  def edit
    @batch_doc = BatchDoc.find(params[:id])
    authorize @batch_doc
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a edit.json view
    end
  end

  def index
    @batch = Batch.find(params[:batch_id])
    @batch_docs = policy_scope(BatchDoc.joins(:batch).where(batch: @batch))
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a update.json view
    end
  end

  def update
    @batch_doc = BatchDoc.find(params[:id])
    @batch_doc.update(batch_doc_params)
    authorize @batch_doc
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a update.json view
    end
  end

  private

  def batch_doc_params
    params.require(:batch_doc).permit(:status)
  end
end
