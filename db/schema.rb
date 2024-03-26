# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_319_184_156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.uuid 'record_id', null: false
    t.uuid 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'companies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.string 'name'
    t.string 'company_email'
    t.string 'phone'
    t.string 'website'
    t.string 'size'
    t.string 'industry'
    t.text 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_companies_on_user_id'
  end

  create_table 'employee_levels', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'employee_id', null: false
    t.uuid 'role_level_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['employee_id'], name: 'index_employee_levels_on_employee_id'
    t.index ['role_level_id'], name: 'index_employee_levels_on_role_level_id'
  end

  create_table 'employee_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'employee_id', null: false
    t.uuid 'role_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['employee_id'], name: 'index_employee_roles_on_employee_id'
    t.index ['role_type_id'], name: 'index_employee_roles_on_role_type_id'
  end

  create_table 'employees', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'scheduling_link'
    t.string 'experience'
    t.string 'heading'
    t.string 'phone'
    t.integer 'search_status', default: 0
    t.text 'bio'
    t.uuid 'primary_role_id', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['primary_role_id'], name: 'index_employees_on_primary_role_id'
    t.index ['user_id'], name: 'index_employees_on_user_id'
  end

  create_table 'locations', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'city', null: false
    t.string 'state', null: false
    t.string 'country', null: false
    t.string 'country_code'
    t.string 'latitude', null: false
    t.string 'longitude', null: false
    t.string 'address', null: false
    t.string 'time_zone'
    t.integer 'utc_offset'
    t.jsonb 'data'
    t.string 'locatable_type', null: false
    t.uuid 'locatable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[locatable_type locatable_id], name: 'index_locations_on_locatable'
  end

  create_table 'open_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'primary_role_id', null: false
    t.uuid 'employee_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['employee_id'], name: 'index_open_roles_on_employee_id'
    t.index ['primary_role_id'], name: 'index_open_roles_on_primary_role_id'
  end

  create_table 'primary_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'role_levels', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'role_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'social_links', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'website'
    t.string 'linkedin'
    t.string 'github'
    t.string 'twitter'
    t.string 'gitlab'
    t.string 'stackoverflow'
    t.string 'sociable_type', null: false
    t.uuid 'sociable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[sociable_type sociable_id], name: 'index_social_links_on_sociable'
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 0
    t.string 'current_state'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'companies', 'users'
  add_foreign_key 'employee_levels', 'employees'
  add_foreign_key 'employee_levels', 'role_levels'
  add_foreign_key 'employee_roles', 'employees'
  add_foreign_key 'employee_roles', 'role_types'
  add_foreign_key 'employees', 'primary_roles'
  add_foreign_key 'employees', 'users'
  add_foreign_key 'open_roles', 'employees'
  add_foreign_key 'open_roles', 'primary_roles'
end
