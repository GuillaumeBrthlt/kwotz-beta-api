class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  # GET /projects
  def index
    @projects = current_user.projects

    render json: @projects
  end

  # GET /projects/1
  def show
    return unless @project.user == current_user

    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params) && @project.user = current_user

      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    return unless @project.user = current_user

    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :name, :status, :message, :supplier_contact_id)
    end
end
