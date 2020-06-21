class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.boolean :completed
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
