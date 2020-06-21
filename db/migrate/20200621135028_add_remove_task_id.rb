class AddRemoveTaskId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :todos, :task_id
  	add_reference :todos, :user_task, foreign_key: :true
  end
end
