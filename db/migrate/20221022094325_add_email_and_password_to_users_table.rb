class AddEmailAndPasswordToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, :before => "created_at"
    add_column :users, :hashed_password, :string, :after => "email"
  end
end
