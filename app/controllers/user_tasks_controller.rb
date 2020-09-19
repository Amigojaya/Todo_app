 class UserTasksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@tasks = current_user.user_tasks.order(:id )
    @quote = Quote.order("RANDOM()").first
  end

  def new
  	@task = UserTask.new
    @task.todos.build
    @quote = Quote.order("RANDOM()").first
  end

  def create

  	@task = UserTask.create(user_task_params)
  	if @task.save
      if current_user.subscribe?
        TestMailer.test_mail_user(current_user, @task).deliver_now
      end
      redirect_to user_tasks_path,success: "#{@task.name.capitalize} is successfully created"
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
      if @task.todos.where(completed: true).count == @task.todos.count
        @task.completed = true
        @task.save
        redirect_to user_task_path(@task),success: "Hurray All Tasks Completed"
      else
        @task.completed = false
        @task.save
        redirect_to user_task_path(@task)
      end
  		
  	else
  		render 'edit'
  	end

  end

  def destroy
      @task = current_user.user_tasks.find(params[:id])
      @task.destroy
      redirect_to manage_path, danger: "#{@task.name.capitalize} Todo Deleted" 
  end

  def destroy1
      @task = current_user.user_tasks.find(params[:id])
      @task.destroy
      redirect_to user_tasks_path, danger: "#{@task.name.capitalize} Todo Deleted" 
  end

  def manage
    @tasks = current_user.user_tasks.order(:id )
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
