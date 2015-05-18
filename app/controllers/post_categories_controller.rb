class PostCategoriesController < ApplicationController
  before_action :set_post_category, only: [:show]

  def show
    @news_menu = Menu.where(place: "news_menu").first
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_category
      @post_category = PostCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_category_params
      params.require(:post_category).permit(:avatar)
    end
end
