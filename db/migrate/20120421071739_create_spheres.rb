class CreateSpheres < ActiveRecord::Migration
  def change
    create_table :spheres do |t|
      t.string :name

      t.timestamps
    end
  end
end
