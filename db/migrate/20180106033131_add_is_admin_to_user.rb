class AddIsAdminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_admin, :boolean, deafault: false
  end
end
