class CreateRouteTags < ActiveRecord::Migration
  def self.up
    create_table :route_tags do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :route_tags
  end
end
