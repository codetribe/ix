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

ActiveRecord::Schema.define(:version => 20110508042555) do

  create_table "bill_lists", :force => true do |t|
    t.string   "product_name"
    t.decimal  "qty",          :default => 1.0
    t.decimal  "total"
    t.integer  "bill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", :force => true do |t|
    t.string   "customer_name"
    t.string   "status",        :default => "b"
    t.decimal  "discount",      :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.decimal  "selling_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
