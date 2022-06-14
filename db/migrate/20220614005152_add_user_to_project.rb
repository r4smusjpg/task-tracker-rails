class AddUserToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :user_id, :bigint

    add_index :projects, :user_id

    add_foreign_key "projects", "users"
  end
end
