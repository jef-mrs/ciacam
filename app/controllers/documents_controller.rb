class DocumentsController < ApplicationController
  def index
    @supplier_documents = policy_scope(Document).where(supplier_id: params[:supplier_id])

    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a index.json view
    end
  end

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @document = Document.new
    authorize @document
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a new.json view
    end
  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @document = Document.create(document_params)
    @document.supplier = @supplier
    @document.save
    authorize @document
    respond_to do |format|
      format.html  { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :validate_date, :supplier_id, :batch_id, :file)
  end
end