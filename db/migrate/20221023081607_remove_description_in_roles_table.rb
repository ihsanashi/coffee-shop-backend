class RemoveDescriptionInRolesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :roles, :description
  end
end
