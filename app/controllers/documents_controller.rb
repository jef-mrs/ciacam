class DocumentsController < ApplicationController
  def index
    @supplier = Supplier.find(params[:supplier_id]) if params[:supplier_id]
    @product = Product.find(params[:product_id]) if params[:product_id]
    @batch = Batch.find(params[:batch_id]) if params[:batch_id]
    @documents = policy_scope(Document)
    @analyse_bios = policy_scope(AnalyseSuppDoc)
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a index.json view
    end
  end

  def new
    @product = Product.find(params[:product_id]) if params[:product_id]
    @supplier = Supplier.find(params[:supplier_id]) if params[:supplier_id]
    @batch = Batch.find(params[:batch_id]) if params[:batch_id]
    @document = Document.new
    @analyse_doc = AnalyseSuppDoc.new
    authorize @document
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a new.json view
    end
  end

  def create
    @document = Document.create(document_params)
    for_who(@document)
    @document.save
    authorize @document
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :validate_date, :supplier_id, :batch_id, :file)
  end

  def for_who(document)
    if params[:supplier_id]
      @supplier = Supplier.find(params[:supplier_id])
      document.supplier = @supplier
    elsif params[:product_id]
      @product = Product.find(params[:product_id])
      document.product = @product
    elsif params[:batch_id]
      @batch = Batch.find(params[:batch_id])
      document.batch = @batch
    end
  end
end
