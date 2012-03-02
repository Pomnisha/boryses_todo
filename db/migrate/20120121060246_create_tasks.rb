class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :tname
      t.string :tdescription
      t.string :tpriority
      t.string :tstate
      t.integer :tasklist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
