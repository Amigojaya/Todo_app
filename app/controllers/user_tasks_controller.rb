 class UserTasksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@tasks = current_user.user_tasks
  end

  def new
  	@task = UserTask.new
    @task.todos.build
    @quote = Quote.order("RANDOM()").first
  end

  def create

  	@task = UserTask.create(user_task_params)
  	if @task.save
  		redirect_to root_path
      if current_user.subscribe?
        TestMailer.test_mail_user(current_user, @task).deliver_now
      end
  	else
  		render 'new'
  	end

  end

  def edit
  	@task = current_user.user_tasks.find(params[:id])
  end

  def update

  	@task = UserTask.find(params[:id])
  	if @task.update(user_task_params)
  		redirect_to user_task_path(@task)
  	else
  		render 'edit'
  	end

  end

  def show
  	@task = current_user.user_tasks.find(params[:id])
    @todos = @task.todos
    @total_count = @task.todos.count
    @completed = @task.todos.where(completed: true).count
    if @task.todos.exists? == true
      
      @width = @completed.to_f/@total_count * 100
        if @width==100
          
        end 
    else
      @width = 0
    end

  end

  private 

  def user_task_params
  	params.require(:user_task).permit(:name, :description, :user_id, todos_attributes: [:id, :name, :completed, :_destroy])
  end


end
