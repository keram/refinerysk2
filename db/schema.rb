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

ActiveRecord::Schema.define(version: 20140210203141) do

  create_table "refinery_after_page_part_snippets", force: true do |t|
    t.integer "snippet_id",               null: false
    t.integer "page_part_id",             null: false
    t.integer "position",     default: 0, null: false
  end

  add_index "refinery_after_page_part_snippets", ["snippet_id", "page_part_id"], name: "index_on_after_snippet_id_and_page_part_id", unique: true

  create_table "refinery_before_page_part_snippets", force: true do |t|
    t.integer "snippet_id",               null: false
    t.integer "page_part_id",             null: false
    t.integer "position",     default: 0, null: false
  end

  add_index "refinery_before_page_part_snippets", ["snippet_id", "page_part_id"], name: "index_on_before_snippet_id_and_page_part_id", unique: true

  create_table "refinery_blog_categories", force: true do |t|
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_blog_categorization", force: true do |t|
    t.integer "blog_post_id",     null: false
    t.integer "blog_category_id", null: false
  end

  add_index "refinery_blog_categorization", ["blog_post_id", "blog_category_id"], name: "index_post_id_and_category_id", unique: true

  create_table "refinery_blog_category_translations", force: true do |t|
    t.integer  "refinery_blog_category_id",              null: false
    t.string   "locale",                                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                     default: "", null: false
    t.string   "slug",                      default: "", null: false
  end

  add_index "refinery_blog_category_translations", ["locale"], name: "index_refinery_blog_category_translations_on_locale"
  add_index "refinery_blog_category_translations", ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31"

  create_table "refinery_blog_post_authors", force: true do |t|
    t.integer "blog_post_id", null: false
    t.integer "user_id",      null: false
  end

  add_index "refinery_blog_post_authors", ["blog_post_id", "user_id"], name: "index_blog_post_id_and_user_id", unique: true

  create_table "refinery_blog_post_translations", force: true do |t|
    t.integer  "refinery_blog_post_id",                              null: false
    t.string   "locale",                                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                            default: "",      null: false
    t.string   "slug",                             default: "",      null: false
    t.string   "status",                limit: 16, default: "draft", null: false
    t.string   "custom_slug"
    t.text     "body"
    t.text     "teaser"
    t.text     "perex"
  end

  add_index "refinery_blog_post_translations", ["locale", "status", "slug"], name: "index_on_locale_status_slug", unique: true
  add_index "refinery_blog_post_translations", ["locale"], name: "index_refinery_blog_post_translations_on_locale"
  add_index "refinery_blog_post_translations", ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id"

  create_table "refinery_blog_posts", force: true do |t|
    t.string   "slug",                         null: false
    t.string   "source_url"
    t.string   "source_url_title"
    t.integer  "access_count",     default: 0, null: false
    t.datetime "published_at",                 null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "refinery_image_translations", force: true do |t|
    t.integer  "refinery_image_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt"
    t.string   "caption"
  end

  add_index "refinery_image_translations", ["locale"], name: "index_refinery_image_translations_on_locale"
  add_index "refinery_image_translations", ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"

  create_table "refinery_imagenizations", force: true do |t|
    t.integer "image_id",                       null: false
    t.integer "imageable_id",                   null: false
    t.string  "imageable_type",                 null: false
    t.integer "position",                       null: false
    t.boolean "featured",       default: false, null: false
  end

  add_index "refinery_imagenizations", ["image_id", "imageable_id", "imageable_type", "position"], name: "index_on_image_id_imageable_id_imageable_type_and_position", unique: true
  add_index "refinery_imagenizations", ["imageable_id", "imageable_type"], name: "index_on_imageable_id_and_imageable_type"

  create_table "refinery_images", force: true do |t|
    t.string   "image_name",   null: false
    t.integer  "image_size",   null: false
    t.integer  "image_width",  null: false
    t.integer  "image_height", null: false
    t.string   "image_uid",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "refinery_images", ["image_name"], name: "index_refinery_images_on_image_name", unique: true
  add_index "refinery_images", ["updated_at"], name: "index_refinery_images_on_updated_at"

  create_table "refinery_page_part_translations", force: true do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"

  create_table "refinery_page_parts", force: true do |t|
    t.integer  "page_id",                   null: false
    t.string   "title",                     null: false
    t.integer  "position",   default: 0,    null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "refinery_page_parts", ["page_id", "title"], name: "index_refinery_page_parts_on_page_id_and_title", unique: true

  create_table "refinery_page_translations", force: true do |t|
    t.integer  "refinery_page_id",                              null: false
    t.string   "locale",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                       default: "",      null: false
    t.string   "slug",                        default: "",      null: false
    t.string   "signature",        limit: 32, default: "",      null: false
    t.string   "status",           limit: 16, default: "draft", null: false
    t.string   "custom_slug"
  end

  add_index "refinery_page_translations", ["locale", "status"], name: "index_refinery_page_translations_on_locale_and_status"
  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  add_index "refinery_page_translations", ["signature", "locale"], name: "index_on_signature_locale", unique: true
  add_index "refinery_page_translations", ["title"], name: "index_refinery_page_translations_on_title"

  create_table "refinery_pages", force: true do |t|
    t.integer  "parent_id"
    t.string   "slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.boolean  "deletable",           default: true,      null: false
    t.boolean  "skip_to_first_child", default: false,     null: false
    t.integer  "lft",                                     null: false
    t.integer  "rgt",                                     null: false
    t.integer  "depth",               default: 0,         null: false
    t.string   "plugin_page_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "page_type",           default: "WebPage", null: false
  end

  add_index "refinery_pages", ["lft", "rgt"], name: "index_refinery_pages_on_lft_and_rgt"
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt"
  add_index "refinery_pages", ["show_in_menu", "lft", "rgt"], name: "index_refinery_pages_on_show_in_menu_and_lft_and_rgt"
  add_index "refinery_pages", ["updated_at"], name: "index_refinery_pages_on_updated_at"

  create_table "refinery_resources", force: true do |t|
    t.string   "file_mime_type", null: false
    t.string   "file_name",      null: false
    t.integer  "file_size",      null: false
    t.string   "file_uid",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "refinery_resources", ["file_name"], name: "index_refinery_resources_on_file_name", unique: true
  add_index "refinery_resources", ["updated_at"], name: "index_refinery_resources_on_updated_at"

  create_table "refinery_roles", force: true do |t|
    t.string "title", limit: 32, null: false
  end

  add_index "refinery_roles", ["title"], name: "index_refinery_roles_on_title", unique: true

  create_table "refinery_roles_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], name: "index_refinery_roles_users_on_role_id_and_user_id", unique: true
  add_index "refinery_roles_users", ["user_id", "role_id"], name: "index_refinery_roles_users_on_user_id_and_role_id", unique: true

  create_table "refinery_snippet_translations", force: true do |t|
    t.integer  "refinery_snippet_id",                         null: false
    t.string   "locale",                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",               limit: 64, default: "", null: false
    t.text     "body"
  end

  add_index "refinery_snippet_translations", ["locale"], name: "index_refinery_snippet_translations_on_locale"
  add_index "refinery_snippet_translations", ["refinery_snippet_id"], name: "index_refinery_snippet_translations_on_refinery_snippet_id"

  create_table "refinery_snippets", force: true do |t|
    t.string   "snippet_type",          default: "text", null: false
    t.string   "canonical_friendly_id",                  null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "refinery_user_plugins", force: true do |t|
    t.integer "user_id",  null: false
    t.string  "name",     null: false
    t.integer "position", null: false
  end

  add_index "refinery_user_plugins", ["name"], name: "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], name: "index_refinery_user_plugins_on_user_id_and_name", unique: true
  add_index "refinery_user_plugins", ["user_id", "position", "name"], name: "index_refinery_user_plugins_on_user_id_and_position_and_name", unique: true

  create_table "refinery_users", force: true do |t|
    t.string   "username",               limit: 64,                null: false
    t.string   "full_name"
    t.string   "email",                                            null: false
    t.string   "encrypted_password",                               null: false
    t.string   "slug",                   limit: 64,                null: false
    t.text     "about"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "locale",                 limit: 8,  default: "en", null: false
    t.string   "frontend_locale",        limit: 8,  default: "sk", null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "image_id"
  end

  create_table "seo_meta", force: true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id",        null: false
    t.integer  "taggable_id",   null: false
    t.string   "taggable_type", null: false
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       null: false
    t.datetime "created_at",    null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name", null: false
  end

end
