class UserCanDisableMails < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :subscribe, :boolean ,default: true
  end
end
