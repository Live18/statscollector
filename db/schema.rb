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

ActiveRecord::Schema.define(version: 2019_10_23_172411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "pts"
    t.integer "reb"
    t.integer "ast"
    t.integer "stls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "game_id"], name: "index_game_stats_on_player_id_and_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.string "home_team"
    t.string "away_team"
    t.integer "scoreboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "roster_reminder_email_sent", default: true
    t.index ["home_team", "away_team"], name: "index_games_on_home_team_and_away_team"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "number"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "scoreboards", force: :cascade do |t|
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.integer "home_team_timeouts_remaining"
    t.integer "away_team_timeouts_remining"
    t.integer "period"
    t.integer "home_team_fouls"
    t.integer "away_team_fouls"
    t.string "posession_arrow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "home_team_current_players"
    t.string "away_team_current_players"
    t.integer "game_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "mascot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_associations", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["user_id", "team_id"], name: "index_user_associations_on_user_id_and_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
