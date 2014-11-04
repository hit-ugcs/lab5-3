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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141104013507) do

  create_table "attens", :force => true do |t|
    t.integer  "student_id"
    t.decimal  "score"
    t.decimal  "week1"
    t.decimal  "week2"
    t.decimal  "week3"
    t.decimal  "week4"
    t.decimal  "week5"
    t.decimal  "week6"
    t.decimal  "week7"
    t.decimal  "week8"
    t.decimal  "week9"
    t.decimal  "week10"
    t.decimal  "week11"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "discs", :force => true do |t|
    t.integer  "student_id"
    t.decimal  "score"
    t.decimal  "week1"
    t.decimal  "week2"
    t.decimal  "week3"
    t.decimal  "week4"
    t.decimal  "week5"
    t.decimal  "week6"
    t.decimal  "week7"
    t.decimal  "week8"
    t.decimal  "week9"
    t.decimal  "week10"
    t.decimal  "week11"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "finals", :force => true do |t|
    t.decimal  "score"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "iterations", :force => true do |t|
    t.decimal  "score"
    t.integer  "iteNum"
    t.integer  "student_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "labs", :force => true do |t|
    t.integer  "student_id"
    t.decimal  "score"
    t.decimal  "lab1"
    t.decimal  "lab2"
    t.decimal  "lab3"
    t.decimal  "lab4"
    t.decimal  "lab5"
    t.decimal  "lab6"
    t.decimal  "lab7"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.decimal  "score"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "studentID"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
