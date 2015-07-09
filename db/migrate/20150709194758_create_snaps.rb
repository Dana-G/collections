class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :name
      t.string :image_uid
      t.string :image_name
      t.integer :year
      t.string :color
      t.text :description
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
