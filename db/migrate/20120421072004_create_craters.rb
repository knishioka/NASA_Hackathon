class CreateCraters < ActiveRecord::Migration
  def change
    create_table :craters do |t|
      t.integer :sphere_id
      t.string :name
      t.decimal :longitude
      t.decimal :latitude
      t.string :image_url

      t.timestamps
    end
    add_index :craters, :sphere_id
  end
end
