class AddRentDueToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :rent_due, :float
  end
end
