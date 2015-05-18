class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :minicart_in_head, :menu, :footer

  #rescue_from ActiveRecord::RecordNotFound, with: :errors_404
  #rescue_from ActiveRecord::NoMethodError, with: :errors_404
  #rescue_from ActionController::RoutingError, with: :errors_404
  


  def after_sign_in_path_for(resource)
    '/administrator/dashboard'
  end

  def after_sign_out_path_for(resource_or_scope)
     request.referrer
  end

  def minicart_in_head
    if session[:cart_id]
      @minicart =  Cart.find(session[:cart_id])
      @cart_url = "/carts/#{@minicart.id}"
    end                
  end


  def menu
    @main_menu = Menu.where(place: "main_menu").first
    @top_menu = Menu.where(place: "top_menu").first
    @product_categories = ProductCategory.all
    @header_content = SiteVariable.where(place: "header")
  end

  def footer
    @footer_content = SiteVariable.where(place: "footer")
    @metrica = SiteVariable.where(place: "settings")
  end

end