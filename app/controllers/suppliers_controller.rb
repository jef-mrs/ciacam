class SuppliersController < ApplicationController
  def index
    @suppliers = policy_scope(Supplier).sort_by { |e| e.name}
    # @suppliers = @suppliers.sort_by { |e| e.name}
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a index.json view
    end
  end

  def create
    @supplies = policy_scope(Supplier)
    @supplier = Supplier.create(supplier_params)
    authorize @supplier
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    authorize @supplier
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a edit.json view
    end
  end

  def update
    @suppliers = policy_scope(Supplier)
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_params)
    authorize @supplier
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a update.json view
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :contact, :bio)
  end
end
