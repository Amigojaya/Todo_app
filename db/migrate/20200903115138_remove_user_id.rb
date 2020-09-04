class RemoveUserId < ActiveRecord::Migration[6.0]
  def change
  	 remove_column :quotes, :user_id, :integer
  end
end
