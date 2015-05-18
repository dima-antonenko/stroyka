class Administrator::MenusController < AdministratorController
  
   before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
    render 'administrator/menus/index'
  end

  def edit
    @menu = Menu.find(params[:id])
    render 'administrator/menus/edit'
    end

    def new
    @menu = Menu.new
    
    end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.create(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to '/administrator/menus', notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to '/administrator/menus', notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.jso

  private

  def menu_params
      params.require(:menu).permit(:title )
  end

  def set_menu
      @menu = Menu.find(params[:id])
    end

end