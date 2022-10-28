class SuppliersController < ApplicationController
  def index
    @suppliers = policy_scope(Supplier)
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

  private

  def supplier_params
    params.require(:supplier).permit(:name, :contact)
  end
end
