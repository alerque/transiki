class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.integer :version
      t.integer :user_id
      t.boolean :visible 
      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
