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

ActiveRecord::Schema.define(version: 20140917004454) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "books_count", default: 0, null: false
  end

  create_table "books", force: true do |t|
    t.integer  "list_id"
    t.string   "title"
    t.string   "publisher"
    t.text     "description"
    t.decimal  "price"
    t.string   "book_review_link"
    t.string   "sunday_review_link"
    t.string   "book_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "isbn"
    t.integer  "author_id"
  end

  create_table "lists", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.string   "updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.integer  "book_id"
    t.integer  "position"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
