class Administrator::PostsController < AdministratorController
  
   before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render 'administrator/posts/index'
  end

  def edit
    @post = Post.find(params[:id])
    render 'administrator/posts/edit'
    end

    def new
    @post = Post.new
    
    end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/administrator/posts', notice: 'Product category was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to '/administrator/posts', notice: 'Product category was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to '/administrator/posts', notice: 'Product category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :post_category_id, :text, :lead, :image,
        :meta_title, :meta_description, :meta_keywords,  :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at,
        :avatar)
  end

  def set_post
      @post = Post.find(params[:id])
    end

end