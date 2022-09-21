class CreateProjectsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_users do |t|
      t.bigint :user_id
      t.bigint :project_id
      t.string :role

      t.timestamps
    end
  end
end
