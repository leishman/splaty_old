class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to  :user
      t.string      :image

      t.timestamps
    end
  end
end
