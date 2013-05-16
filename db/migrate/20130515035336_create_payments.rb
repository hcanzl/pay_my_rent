class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :payment_date
      t.references :user

      t.timestamps
    end
    add_index :payments, :user_id
  end
end
