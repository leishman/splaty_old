class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text :notes

      t.belongs_to :user
      t.timestamps
    end
  end
end
