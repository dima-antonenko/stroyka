class Administrator::OrdersController < AdministratorController

	before_action :set_order, only: [:edit, :destroy, :delete]

	def index
		@orders = Order.all
		render 'administrator/orders/index'
	end

	def edit
		@order = Order.find(params[:id])
  	end

  	def destroy
	    @order = Order.find(params[:id])
	    @order.destroy
	    redirect_to '/administrator/orders'
  	end

  private

  def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :total_price, :phone_number, :region, :sity )
  end

  def set_order
      @order = Order.find(params[:id])
    end


end