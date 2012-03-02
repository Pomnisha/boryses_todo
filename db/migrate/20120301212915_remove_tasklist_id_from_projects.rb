class RemoveTasklistIdFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :tasklist_id
  end

  def down
  end
end
