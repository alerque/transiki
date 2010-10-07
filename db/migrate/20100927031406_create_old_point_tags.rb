class CreateOldPointTags < ActiveRecord::Migration
  def self.up
    create_table :old_point_tags do |t|
      t.string :key
      t.string :value
      t.integer :point_id
      t.integer :version
      t.timestamps
    end
  end

  def self.down
    drop_table :old_point_tags
  end
end
