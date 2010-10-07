class CreateRoutePoints < ActiveRecord::Migration
  def self.up
    create_table :route_points do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :route_points
  end
end
