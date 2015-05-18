class Administrator::MenuItemsController < AdministratorController
  
   before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menu_items = MenuItem.all
    render 'administrator/menus/index'
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
    @menus = Menu.all
    
  end

    def new
    @menu_item = MenuItem.new
    
    end

  # POST /menus
  # POST /menus.json
  def create
    @menu_item = MenuItem.create(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to '/administrator/menus', notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to '/administrator/menus', notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to '/administrator/menus', notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.jso

  private

  def menu_item_params
      params.require(:menu_item).permit(:title, :menu_id, :menu_item_id, :title, :link, :position )
  end

  def set_menu
      @menu_item = MenuItem.find(params[:id])
    end

end