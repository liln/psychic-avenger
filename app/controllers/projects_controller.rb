class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created."
          redirect_to @project
        else
          flash.now[:error] = "Project could not be saved."
          render :new
        end
      end
      format.js do
        if @project.save
        else
          render text: @project.errors.full_messages.join(". "), status: :unprocessable_entity
        end
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      format.html do
        if @project.update_attributes(project_params)
          redirect_to @project, notice: "Project was successfully updated."
        else
          flash.now[:error] = "Project could not be saved."
          render :edit
        end
      end
      format.js do
        if @project.update_attributes(project_params)
        else
          render text: @project.errors.full_messages.join(". "), status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :technologies_used, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
