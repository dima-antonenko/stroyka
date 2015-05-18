class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]
  # GET /product_categories
  # GET /product_categories.json
  def index
    @collections = Collection.paginate(:page => params[:page], :per_page => 10)
   
  end

  # GET /product_categories/1
  # GET /product_categories/1.json
  def show
   
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params

      params.require(:collection).permit(:avatar)
    end
end
