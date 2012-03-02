class AddProjectColToTasklists < ActiveRecord::Migration
  def change
    add_column :tasklists, :project_id, :integer
  end
end
