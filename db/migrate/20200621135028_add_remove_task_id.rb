class AddRemoveTaskId < ActiveRecord::Migration[6.0]
  def change
  	add_reference :todos, :user_task, foreign_key: :true
  end
end
