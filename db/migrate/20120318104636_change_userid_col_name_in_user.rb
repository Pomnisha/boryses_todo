class ChangeUseridColNameInUser < ActiveRecord::Migration
  def up
    rename_column :projects, :user_id, :owner_id
  end

  def down
    rename_column :projects, :owner_id, :user_id
  end
end
