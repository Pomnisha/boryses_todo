class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :mname
      t.string :gender
      t.string :password

      t.timestamps
    end
  end
end
