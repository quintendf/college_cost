# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140531224556) do

  create_table "prices", force: true do |t|
    t.string   "college"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salaries", force: true do |t|
    t.string   "major"
    t.decimal  "starting_salary"
    t.decimal  "mid_career_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "college"
    t.string   "major"
    t.decimal  "scholarships"
    t.decimal  "contribution"
    t.decimal  "yearly_cost"
    t.decimal  "total_debt"
    t.decimal  "monthly_cost"
    t.decimal  "monthly_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_id"
    t.string   "grade"
    t.string   "explainer_text"
  end

end
