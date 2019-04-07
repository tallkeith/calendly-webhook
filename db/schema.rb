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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190407183801) do

  create_table "webhooks", force: :cascade do |t|
    t.string "data"
    t.string "integration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "canceled"
    t.string "start_time"
    t.string "end_time"
    t.string "canceler"
    t.string "cancel_reason"
    t.string "canceled_at"
    t.string "invitee_name"
    t.string "invitee_email"
    t.string "event_name"
  end

end