class Administrator::BannersController < AdministratorController
  
   before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @banners = Banner.all
    render 'administrator/banners/index'
  end

  def edit
    @banner = Banner.find(params[:id])
    render 'administrator/banners/edit'
    end

    def new
    @banner = Banner.new
    
    end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.create(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to '/administrator/banners', notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banners/1
  # PATCH/PUT /banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to '/administrator/banners', notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.jso

  private

  def banner_params
      params.require(:banner).permit(:avatar, :title, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :avatar)
  end

  def set_menu
      @banner = Banner.find(params[:id])
    end

end