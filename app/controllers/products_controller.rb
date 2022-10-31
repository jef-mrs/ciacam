class ProductsController < ApplicationController
  def index
    @products = policy_scope(Product).sort_by { |e| e.name}
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a index.json view
    end
  end

  def create
    @products = policy_scope(Product)
    @product = Product.create(product_params)
    authorize @product
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a edit.json view
    end
  end

  def update
    @products = policy_scope(Product)
    @product = Product.find(params[:id])
    @product.update(product_params)
    authorize @product
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a update.json view
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo)
  end
end
