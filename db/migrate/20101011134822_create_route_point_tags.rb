class CreateRoutePointTags < ActiveRecord::Migration
  def self.up
    create_table :route_point_tags do |t|
      t.integer :route_id
      t.integer :point_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :route_point_tags
  end
end
