class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,   :null => false
      t.string :email,      :null => false

      t.timestamps
    end
    add_index :users, :username, :unique => true # index on username, enforce uniqueness
  end
end
