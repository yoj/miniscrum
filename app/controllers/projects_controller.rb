class ProjectsController < ApplicationController
  def index
    @projects = current_user.myproject
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_param)
    @project.user_id = current_user.id
    
    # transaction
    result = false
    ActiveRecord::Base.transaction do
      @project.save!
      @project_user = ProjectUser.new(user_id: current_user.id, project_id: @project.id)
      @project_user.save!
      result = true
    end
    
    if result
      redirect_to projects_path, success: "プロジェクトを登録しました。"
    else
      render plain: "error"
    end
  
  end

  def show
    @project = current_user.myproject.find(params[:id])
    @tasks =  Task.where(project_id: @project.id, user_id: current_user.id)
  end
  
  private
  def project_param
    params.require(:project).permit(:name, :description)
  end
end
