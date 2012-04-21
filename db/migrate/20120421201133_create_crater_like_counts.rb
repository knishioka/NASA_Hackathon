class CreateCraterLikeCounts < ActiveRecord::Migration
  def change
    create_table :crater_like_counts do |t|
      t.integer :crater_id, :null => false
      t.integer :like_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :crater_like_counts, :crater_id, :unique => true
  end
end
