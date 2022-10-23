class SuppliersController < ApplicationController
  def index
    @suppliers = policy_scope(Supplier)

    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier
    if @supplier.save
      flash.notice = 'Fournissuer bien enregistré'
    else
      flash.alert = "Problème lors de l'enregistrement veuillez recomencer"
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :contact)
  end
end
