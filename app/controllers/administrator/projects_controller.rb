class Administrator::ProjectsController < AdministratorController

 before_action :set_project, only: [:edit, :update, :destroy, :delete]


	def index
		@projects = Project.paginate(:page => params[:page], :per_page => 10)
		render 'administrator/projects/index'
	end

	def edit
		@project = Project.find(params[:id])
		render 'administrator/projects/edit'
  	end

  	# GET /projects/new
  def new
    @project = Project.new
  end

 

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to '/administrator/projects', notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @project.assign_attributes(project_params)
    
    unless @project.valid?
    Rails.logger.debug @project.errors.full_messages
    end

    respond_to do |format|
      if @project.save
        format.html { redirect_to '/administrator/projects', notice: 'Project was successfully updated.' }
        format.json { render :index, status: :ok, location: @project }
      else
        format.html { render :update }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to '/administrator/projects'
  end

  private

  def project_params
      params.require(:project).permit(:title, :description, :meta_title, :meta_description, :meta_keywords, :avatar)
  end

  def set_project
      @project = Project.find(params[:id])
    end

end