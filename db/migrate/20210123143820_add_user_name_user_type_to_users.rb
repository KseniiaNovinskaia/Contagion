class AddUserNameUserTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :type, :string
  end
end
