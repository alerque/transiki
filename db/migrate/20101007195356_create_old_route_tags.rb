class CreateOldRouteTags < ActiveRecord::Migration
  def self.up
    create_table :old_route_tags do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :old_route_tags
  end
end
