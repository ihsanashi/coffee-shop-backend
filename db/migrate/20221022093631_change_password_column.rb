class ChangePasswordColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :hashed_password, :password_digest
  end
end
