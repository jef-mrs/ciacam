class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product)
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a index.json view
    end
  end

  def create
    @products = policy_scope(Product)
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
      flash.notice = 'Produit bien enregistré'
    else
      # flash.alert = "Problème lors de l'enregistrement veuillez recomencer"
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.json
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
