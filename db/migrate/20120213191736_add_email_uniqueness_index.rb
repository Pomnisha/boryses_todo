class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
	add_column :users, :email, :string
	add_index :users, :email, :unique => true
  end

  def down
	remove_index :users, :email
  end
end
