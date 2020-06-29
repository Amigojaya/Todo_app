class AddingStatusForQuotes < ActiveRecord::Migration[6.0]
  def change
  	add_column :quotes , :status, :string , :default => "pending"
  end
end
