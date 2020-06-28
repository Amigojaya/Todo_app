class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.text :quotes
      t.text :author
      t.integer :user_id

      t.timestamps
    end
  end
end
