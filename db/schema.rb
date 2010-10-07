# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101007195801) do

  create_table "old_point_tags", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "point_id"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_points", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "point_id"
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_route_points", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_route_tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_routes", :force => true do |t|
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "point_tags", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "point_id"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "points", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_points", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_tags", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.integer  "version"
    t.integer  "user_id"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
