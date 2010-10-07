class CreateOldRoutePoints < ActiveRecord::Migration
  def self.up
    create_table :old_route_points do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :old_route_points
  end
end
