class ProjectsController < ApplicationController
  before_action :project, only: [:show, :edit, :update, :destroy]
  # GET /products/1
  # GET /products/1.json
  def show
  end

  def index
    @projects = Project.all
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:avatar)
    end
end
