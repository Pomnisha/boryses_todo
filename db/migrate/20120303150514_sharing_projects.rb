class SharingProjects < ActiveRecord::Migration
  def up
    create_table :sharing_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end

  def down
    drop_table :sharing_projects
  end
end
