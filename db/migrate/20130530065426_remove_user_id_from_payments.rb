class RemoveUserIdFromPayments < ActiveRecord::Migration
  def up
    remove_column :payments, :user_id
  end

  def down
    add_column :payments, :user_id, :integer
  end
end
