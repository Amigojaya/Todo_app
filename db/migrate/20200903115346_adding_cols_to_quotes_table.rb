class AddingColsToQuotesTable < ActiveRecord::Migration[6.0]
  def change
  	add_reference :quotes, :user, foreign_key: true
  end
end
