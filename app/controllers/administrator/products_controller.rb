class Administrator::ProductsController < AdministratorController

 before_action :set_product, only: [:edit, :update, :destroy, :delete]

	def index
		@products = Product.paginate(:page => params[:page], :per_page => 10)
		render 'administrator/products/index'
	end

	def edit
		@product = Product.find(params[:id])
		render 'administrator/products/edit'
  	end

  	# GET /products/new
  def new
    @product = Product.new
  end

 

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to '/administrator/products', notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to '/administrator/products', notice: 'Product was successfully updated.' }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/administrator/products'
  end

  private

  def product_params
      params.require(:product).permit(:product_category_id, :name, :description, :image,
        :sku, :meta_title, :meta_description, :meta_keywords, :price, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at,
        :avatar)
  end

  def set_product
      @product = Product.find(params[:id])
    end

end