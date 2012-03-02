class ChangeTalkListDescriptionType < ActiveRecord::Migration
  def up
    change_column :tasklists, :tldescription, :text      
  end

  def down
  end
end
