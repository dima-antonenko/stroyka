class ProjectAttacmentsController < ApplicationController
  before_action :set_project_attacment, only: [:show, :edit, :update, :destroy]

  # GET /project_attacments
  # GET /project_attacments.json
  def index
    @project_attacments = ProjectAttacment.all
  end

  # GET /project_attacments/1
  # GET /project_attacments/1.json
  def show
  end

  # GET /project_attacments/new
  def new
    @project_attacment = ProjectAttacment.new
  end

  # GET /project_attacments/1/edit
  def edit
  end

  # POST /project_attacments
  # POST /project_attacments.json
  def create
    @project_attacment = ProjectAttacment.new(project_attacment_params)

    respond_to do |format|
      if @project_attacment.save
        format.html { redirect_to @project_attacment, notice: 'Project attacment was successfully created.' }
        format.json { render :show, status: :created, location: @project_attacment }
      else
        format.html { render :new }
        format.json { render json: @project_attacment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_attacments/1
  # PATCH/PUT /project_attacments/1.json
  def update
    respond_to do |format|
      if @project_attacment.update(project_attacment_params)
        format.html { redirect_to @project_attacment, notice: 'Project attacment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_attacment }
      else
        format.html { render :edit }
        format.json { render json: @project_attacment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_attacments/1
  # DELETE /project_attacments/1.json
  def destroy
    @project_attacment.destroy
    respond_to do |format|
      format.html { redirect_to project_attacments_url, notice: 'Project attacment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_attacment
      @project_attacment = ProjectAttacment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_attacment_params
      params[:project_attacment]
    end
end
