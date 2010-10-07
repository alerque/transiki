class CreateOldPoints < ActiveRecord::Migration
  def self.up
    create_table :old_points do |t|
      t.float :latitude
      t.float :longitude
      t.integer :point_id
      t.integer :version
      t.integer :user_id
      t.boolean :visible
      t.timestamps
    end
  end

  def self.down
    drop_table :old_points
  end
end
