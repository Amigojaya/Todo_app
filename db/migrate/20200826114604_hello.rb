class Hello < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :subscribe_quote, :boolean ,default: true
  end
end
