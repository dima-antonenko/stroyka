class Administrator::SiteVariablesController < AdministratorController

 before_action :set_site_variable, only: [:edit, :update, :destroy, :delete]

  def index
    @site_variables = SiteVariable.all
    render 'administrator/site_variables/index'
  end

  def blocks_in_header
    @site_variables = SiteVariable.where(place: "header")
    render 'administrator/site_variables/blocks_in_header'
  end

  def blocks_in_footer
    @site_variables = SiteVariable.where(place: "footer")
    render 'administrator/site_variables/blocks_in_footer'
  end

  def page_contact
    @site_variables = SiteVariable.where(place: "page_contact")
    render 'administrator/site_variables/page_contact'
  end

  def page_delivery_pay
    @site_variables = SiteVariable.where(place: "page_delivery_pay")
    render 'administrator/site_variables/page_delivery_pay'
  end

  def page_company_info
    @site_variables = SiteVariable.where(place: "page_company_info")
    render 'administrator/site_variables/page_company_info'
  end

  def settings
    @site_variables = SiteVariable.where(place: "settings")
    render 'administrator/settings/main'
  end

  def page_home
    @site_variables = SiteVariable.where(place: "page_home")
    render 'administrator/site_variables/page_home'
  end


  def edit
    @site_variable = SiteVariable.find(params[:id])
    render 'administrator/site_variables/edit'
  end

    # GET /products/new
  def new
    @site_variable = SiteVariable.new
  end

 

  # POST /products
  # POST /products.json
  def create
    @site_variable = SiteVariable.new(site_variable_params)

    respond_to do |format|
      if @site_variable.save
        format.html { redirect_to '/administrator/site_variables', notice: 'SiteVariable was successfully created.' }
        format.json { render :show, status: :created, location: @site_variable }
      else
        format.html { render :new }
        format.json { render json: @site_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @site_variable = SiteVariable.find(params[:id])
    respond_to do |format|
      if @site_variable.update(site_variable_params)
        format.html { redirect_to '/administrator/site_variables', notice: 'SiteVariable was successfully updated.' }
        format.json { render :index, status: :ok, location: @site_variable }
      else
        format.html { render :edit }
        format.json { render json: @site_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @site_variable = SiteVariable.find(params[:id])
    @site_variable.destroy
    redirect_to '/administrator/site_variables'
  end

  private

  def site_variable_params
      params.require(:site_variable).permit(:value, :name)
  end

  def set_site_variable
      @site_variable = SiteVariable.find(params[:id])
    end

end