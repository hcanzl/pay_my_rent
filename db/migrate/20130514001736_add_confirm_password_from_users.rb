class AddConfirmPasswordFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmpassword, :string
  end
end
