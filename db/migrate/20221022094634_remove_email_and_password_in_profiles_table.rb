class RemoveEmailAndPasswordInProfilesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :email
    remove_column :profiles, :password_digest
  end
end
