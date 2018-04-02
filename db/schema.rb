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

ActiveRecord::Schema.define(version: 20180402222518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.boolean "correct"
    t.string "type"
    t.string "body"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "examinations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "password_digest"
    t.text "intro"
    t.text "conclusion"
    t.string "passcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examinations_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "examination_id"
    t.integer "points", default: 1
    t.string "question_type"
    t.text "body"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_questions_on_examination_id"
  end

  create_table "responseanswers", force: :cascade do |t|
    t.bigint "response_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_responseanswers_on_answer_id"
    t.index ["response_id"], name: "index_responseanswers_on_response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "answer_ids"
    t.bigint "score_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected"
    t.text "answer"
    t.string "fill_blank"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["score_id"], name: "index_responses_on_score_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "examination_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_scores_on_examination_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "paypal_customer_token"
    t.string "paypal_payment_token"
    t.string "paypal_email"
    t.datetime "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "age"
    t.string "country"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "examinations", "users"
  add_foreign_key "questions", "examinations"
  add_foreign_key "responseanswers", "answers"
  add_foreign_key "responseanswers", "responses"
  add_foreign_key "responses", "scores"
  add_foreign_key "scores", "examinations"
  add_foreign_key "scores", "users"
  add_foreign_key "subscriptions", "users"
end
