class CreateTasklists < ActiveRecord::Migration
  def change
    create_table :tasklists do |t|
      t.string :tlname
      t.string :tldescription
      t.integer :user_id

      t.timestamps
    end
  end
end
