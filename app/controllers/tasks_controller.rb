class TasksController < ApplicationController
  def index
    
  end
  
  def new
    @task = Task.new
    # プロジェクト内のユーザ
    @users = current_project.joinuser
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.project_id = params[:project_id]
    
    if @task.save
      render plain: "success"
    else
      render plain: @task.errors
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  def current_project
    @current_project ||= Project.find(params[:project_id])
  end
  
  def task_params
    params.require(:task).permit(:title, :body, :start_date, :end_date, :status, 
    :priority, :assign, :project_id)
  end
end
