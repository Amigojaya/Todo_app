class CreateUserTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tasks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
