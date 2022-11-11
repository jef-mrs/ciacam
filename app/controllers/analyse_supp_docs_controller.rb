class AnalyseSuppDocsController < ApplicationController
  def create
    @analyse_supp = AnalyseSuppDoc.create(analyse_supp_doc_params)
    @analyse_supp.supplier = Supplier.find(params[:supplier_id])
    @analyse_supp.product = Product.find(params[:analyse_supp_doc][:product_id])
    @analyse_supp.save
    authorize @analyse_supp
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def analyse_supp_doc_params
    params.require(:analyse_supp_doc).permit(:title, :supplier_id, :product_id, :file)
  end
end
