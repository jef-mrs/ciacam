class BatchsController < ApplicationController
  def index
    @batchs = policy_scope(Batch)

    respond_to do |format|
      format.html { render 'pages/buy' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

end
