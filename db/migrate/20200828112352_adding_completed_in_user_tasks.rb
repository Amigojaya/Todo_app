class AddingCompletedInUserTasks < ActiveRecord::Migration[6.0]
  def change
  	add_column :user_tasks, :completed, :boolean 
  end
end
