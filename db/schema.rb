# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110419020634) do

  create_table "bikes", :force => true do |t|
    t.string   "manufacturer"
    t.string   "model_name"
    t.string   "frame_number"
    t.integer  "user_id"
    t.string   "image_filename"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bikes", ["user_id"], :name => "index_bikes_on_user_id"

  create_table "components", :force => true do |t|
    t.string   "item"
    t.string   "manufacturer"
    t.string   "group_name"
    t.string   "model_name"
    t.integer  "weight"
    t.integer  "bike_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "components", ["bike_id"], :name => "index_components_on_bike_id"

  create_table "records", :force => true do |t|
    t.date     "maintain_at"
    t.string   "content"
    t.integer  "bike_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "records", ["bike_id"], :name => "index_records_on_bike_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end