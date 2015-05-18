class Administrator::ProductCategoriesController < AdministratorController
  
   before_action :set_product_category, only: [:show, :edit, :update, :destroy]

  def index
    @product_categories = ProductCategory.all
    render 'administrator/product_categories/index'
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
    render 'administrator/product_categories/edit'
    end

    def new
    @product_category = ProductCategory.new
    
    end

  # POST /product_categories
  # POST /product_categories.json
  def create
    @product_category = ProductCategory.new(product_category_params)

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to '/administrator/product_categories', notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @product_category }
      else
        format.html { render :new }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_categories/1
  # PATCH/PUT /product_categories/1.json
  def update
    respond_to do |format|
      if @product_category.update(product_category_params)
        format.html { redirect_to '/administrator/product_categories', notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_category }
      else
        format.html { render :edit }
        format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_categories/1
  # DELETE /product_categories/1.json
  def destroy
    @product_category.destroy
    respond_to do |format|
      format.html { redirect_to '/administrator/product_categories', notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def product_category_params
      params.require(:product_category).permit(:name, :product_category_id, :description, :image,
        :meta_title, :meta_description, :meta_keywords,  :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at,
        :avatar, :big_image)
  end

  def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

end