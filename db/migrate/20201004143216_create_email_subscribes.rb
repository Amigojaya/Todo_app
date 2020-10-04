class CreateEmailSubscribes < ActiveRecord::Migration[6.0]
  def change
    create_table :email_subscribes do |t|
      t.string :email
      t.boolean :unsubscribe

      t.timestamps
    end
  end
end
