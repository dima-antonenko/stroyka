class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
    @product_category_menu = Menu.where(place: "catalog_menu").first
  end

  # GET /product_categories/1
  # GET /product_categories/1.json
  def show
    @product_category_menu = Menu.where(place: "catalog_menu").first
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_category_params

      params[:product_category]
    end
end
