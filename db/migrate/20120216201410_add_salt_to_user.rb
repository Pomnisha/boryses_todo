class AddSaltToUser < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    add_column :users, :encrypted_password, :string
    remove_column :users, :password
  end
end
