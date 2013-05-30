class RemoveConfirmpasswordFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :confirmpassword
  end

  def down
    add_column :users, :confirmpassword, :string, :default => ""
  end
end
