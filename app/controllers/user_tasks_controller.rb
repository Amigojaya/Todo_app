class UserTasksController < ApplicationController
  def index
  	@tasks = UserTask.all
  end

  def new
  	@task = UserTask.new
     @task.todos.build
  end

  def create

  	@task = UserTask.create(user_task_params)
  	if @task.save
  		redirect_to root_path
  	else
  		render 'new'
  	end

  end

  def edit
  	@task = UserTask.find(params[:id])
  end

  def update

  	@task = UserTask.find(params[:id])
  	if @task.update(user_task_params)
  		redirect_to root_path
  	else
  		render 'edit'
  	end

  end

  def show
  	@task = UserTask.find(params[:id])
  end

  private 

  def user_task_params
  	params.require(:user_task).permit(:name, :description, :user_id, todos_attributes: [:id, :name, :completed, :_destroy])
  end


end
