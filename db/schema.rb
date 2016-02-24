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

ActiveRecord::Schema.define(version: 20160222150432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_courses", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_courses", ["category_id"], name: "index_categories_courses_on_category_id", using: :btree
  add_index "categories_courses", ["course_id"], name: "index_categories_courses_on_course_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title",      default: ""
  end

  create_table "conversations_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "conversations_users", ["conversation_id", "user_id"], name: "index_conversations_users_on_conversation_id_and_user_id", unique: true, using: :btree
  add_index "conversations_users", ["conversation_id"], name: "index_conversations_users_on_conversation_id", using: :btree
  add_index "conversations_users", ["user_id"], name: "index_conversations_users_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "short_description"
    t.string   "author"
    t.integer  "order"
    t.integer  "user_id"
    t.boolean  "temporal",           default: false
    t.string   "image_url"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "courses_sorting_courses", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "sorting_course_id"
  end

  add_index "courses_sorting_courses", ["course_id", "sorting_course_id"], name: "courses_sorting_courses_index", unique: true, using: :btree

  create_table "courses_users", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id", using: :btree
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id"
  end

  add_index "groups", ["course_id"], name: "index_groups_on_course_id", using: :btree

  create_table "groups_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "video_url"
    t.string   "subtitles_url"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "group_id"
    t.integer  "conversation_id"
    t.integer  "replay_id"
    t.string   "title",           default: ""
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["group_id"], name: "index_messages_on_group_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "messages_users", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.boolean  "displayed",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "conversation_id"
  end

  add_index "messages_users", ["message_id"], name: "index_messages_users_on_message_id", using: :btree
  add_index "messages_users", ["user_id"], name: "index_messages_users_on_user_id", using: :btree

  create_table "question_answers", force: :cascade do |t|
    t.string   "description"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_answers", ["question_id"], name: "index_question_answers_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.integer  "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["test_id"], name: "index_questions_on_test_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_components", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "component_id"
    t.string   "component_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "section_components", ["component_id"], name: "index_section_components_on_component_id", using: :btree
  add_index "section_components", ["section_id"], name: "index_section_components_on_section_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
    t.integer  "order"
    t.integer  "course_id"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree

  create_table "sequences", force: :cascade do |t|
    t.integer  "order"
    t.integer  "foreign_key"
    t.string   "sequence_type"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sequences", ["course_id"], name: "index_sequences_on_course_id", using: :btree

  create_table "sorting_courses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "user_dependency", default: false
    t.boolean  "time_dependency", default: false
    t.integer  "order"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "from_date"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.string   "auth_token",             default: ""
    t.string   "login"
    t.string   "role",                   default: "normal"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_lessons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "short_description"
    t.string   "video_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_foreign_key "categories_courses", "categories"
  add_foreign_key "categories_courses", "courses"
  add_foreign_key "conversations_users", "conversations"
  add_foreign_key "conversations_users", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "courses_users", "courses"
  add_foreign_key "courses_users", "users"
  add_foreign_key "groups", "courses"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "messages_users", "messages"
  add_foreign_key "messages_users", "users"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "tests"
  add_foreign_key "section_components", "sections"
  add_foreign_key "sections", "courses"
  add_foreign_key "sequences", "courses"
end
