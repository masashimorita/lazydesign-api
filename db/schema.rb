# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_073928) do

  create_table "configuration_types", primary_key: "configuration_type_id", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "configuration_type_name"
  end

  create_table "deploy_methods", primary_key: "deploy_method_id", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "deploy_method_name", null: false
    t.string "deploy_program", null: false
    t.string "entry_point", null: false
  end

  create_table "file_types", primary_key: "file_type_id", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "file_type_name", null: false
    t.string "file_extension", null: false
  end

  create_table "product_types", primary_key: "product_type_id", id: :bigint, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "product_type_name", null: false
  end

  create_table "template_infos", primary_key: "template_info_id", id: :binary, limit: 128, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.binary "template_id", limit: 128, null: false
    t.binary "template_part_id", limit: 128, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_id"], name: "fk_rails_577bb18098"
    t.index ["template_part_id"], name: "fk_rails_dfd8ac0a46"
  end

  create_table "template_parts", primary_key: "template_part_id", id: :binary, limit: 128, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "part_name", null: false
    t.text "part_description"
    t.string "part_thumbnail"
    t.text "content_markup", null: false
    t.text "content_style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "templates", primary_key: "template_id", id: :binary, limit: 128, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "product_type_id", null: false
    t.string "template_name", null: false
    t.text "template_description"
    t.string "template_thumbnail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_type_id"], name: "fk_rails_6d798429e5"
  end

  create_table "users", primary_key: "user_id", id: :binary, limit: 128, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "template_infos", "template_parts", primary_key: "template_part_id"
  add_foreign_key "template_infos", "templates", primary_key: "template_id"
  add_foreign_key "templates", "product_types", primary_key: "product_type_id"
end
