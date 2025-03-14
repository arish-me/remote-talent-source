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

ActiveRecord::Schema[7.1].define(version: 20_240_713_050_258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.uuid 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

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

  create_table 'categories', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'companies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.string 'name'
    t.string 'company_email'
    t.string 'tagline'
    t.integer 'founded'
    t.string 'phone'
    t.string 'website'
    t.string 'size'
    t.string 'public_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_companies_on_user_id'
  end

  create_table 'company_industries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'industry_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_company_industries_on_company_id'
    t.index ['industry_id'], name: 'index_company_industries_on_industry_id'
  end

  create_table 'company_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'job_id', null: false
    t.uuid 'role_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_company_roles_on_company_id'
    t.index ['job_id'], name: 'index_company_roles_on_job_id'
    t.index ['role_type_id'], name: 'index_company_roles_on_role_type_id'
  end

  create_table 'company_specialities', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'company_id', null: false
    t.uuid 'speciality_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_company_specialities_on_company_id'
    t.index ['speciality_id'], name: 'index_company_specialities_on_speciality_id'
  end

  create_table 'connection_requests', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'employee_id', null: false
    t.uuid 'company_id', null: false
    t.integer 'status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_connection_requests_on_company_id'
    t.index ['employee_id'], name: 'index_connection_requests_on_employee_id'
  end

  create_table 'conversations', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'employee_id', null: false
    t.uuid 'company_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_conversations_on_company_id'
    t.index ['employee_id'], name: 'index_conversations_on_employee_id'
  end

  create_table 'countries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'emoji'
    t.string 'iso2'
    t.string 'iso3'
    t.uuid 'currency_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['currency_id'], name: 'index_countries_on_currency_id'
  end

  create_table 'currencies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'symbol'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
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
    t.string 'public_url'
    t.string 'badges', default: [], null: false, array: true
    t.integer 'search_status', default: 0
    t.uuid 'primary_role_id', null: false
    t.uuid 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['primary_role_id'], name: 'index_employees_on_primary_role_id'
    t.index ['user_id'], name: 'index_employees_on_user_id'
  end

  create_table 'follows', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'employee_id', null: false
    t.uuid 'company_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_follows_on_company_id'
    t.index ['employee_id'], name: 'index_follows_on_employee_id'
  end

  create_table 'industries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'job_boards', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'api_url'
    t.string 'logo_url'
    t.string 'api_key'
    t.string 'api_token'
    t.datetime 'last_run_at'
    t.datetime 'last_updated_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'job_countries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'job_id', null: false
    t.uuid 'country_id', null: false
    t.index ['country_id'], name: 'index_job_countries_on_country_id'
    t.index ['job_id'], name: 'index_job_countries_on_job_id'
  end

  create_table 'jobs', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.integer 'apply_type', default: 0
    t.string 'apply_url'
    t.boolean 'worldwide', default: true
    t.string 'badges', default: [], null: false, array: true
    t.uuid 'user_id'
    t.uuid 'company_id'
    t.string 'current_state'
    t.string 'slug'
    t.string 'source_id'
    t.string 'source_name'
    t.string 'source_logo'
    t.datetime 'publish_date'
    t.integer 'job_type'
    t.string 'position'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'job_board_id', null: false
    t.index ['company_id'], name: 'index_jobs_on_company_id'
    t.index ['job_board_id'], name: 'index_jobs_on_job_board_id'
    t.index ['user_id'], name: 'index_jobs_on_user_id'
  end

  create_table 'location_types', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
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

  create_table 'messages', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'conversation_id'
    t.string 'sender_type'
    t.uuid 'sender_id'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['conversation_id'], name: 'index_messages_on_conversation_id'
    t.index %w[sender_type sender_id], name: 'index_messages_on_sender'
  end

  create_table 'noticed_events', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'type'
    t.string 'record_type'
    t.uuid 'record_id'
    t.jsonb 'params'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'notifications_count'
    t.index %w[record_type record_id], name: 'index_noticed_events_on_record'
  end

  create_table 'noticed_notifications', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'type'
    t.uuid 'event_id', null: false
    t.string 'recipient_type', null: false
    t.uuid 'recipient_id', null: false
    t.datetime 'read_at', precision: nil
    t.datetime 'seen_at', precision: nil
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_noticed_notifications_on_event_id'
    t.index %w[recipient_type recipient_id], name: 'index_noticed_notifications_on_recipient'
  end

  create_table 'open_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'primary_role_id', null: false
    t.uuid 'employee_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['employee_id'], name: 'index_open_roles_on_employee_id'
    t.index ['primary_role_id'], name: 'index_open_roles_on_primary_role_id'
  end

  create_table 'preferred_locations', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'locatable_type', null: false
    t.uuid 'locatable_id', null: false
    t.uuid 'location_type_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[locatable_type locatable_id], name: 'index_preferred_locations_on_locatable'
    t.index ['location_type_id'], name: 'index_preferred_locations_on_location_type_id'
  end

  create_table 'primary_roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'category_id', null: false
    t.index ['category_id'], name: 'index_primary_roles_on_category_id'
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

  create_table 'salaries', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'salable_type', null: false
    t.uuid 'salable_id', null: false
    t.decimal 'min', default: '0.0'
    t.decimal 'max', default: '0.0'
    t.integer 'salary_type', default: 0
    t.uuid 'currency_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['currency_id'], name: 'index_salaries_on_currency_id'
    t.index %w[salable_type salable_id], name: 'index_salaries_on_salable'
  end

  create_table 'skillables', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'skillable_type', null: false
    t.uuid 'skillable_id', null: false
    t.uuid 'skill_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['skill_id'], name: 'index_skillables_on_skill_id'
    t.index %w[skillable_type skillable_id], name: 'index_skillables_on_skillable'
  end

  create_table 'skills', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.uuid 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_skills_on_category_id'
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

  create_table 'specialities', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'taggings', force: :cascade do |t|
    t.bigint 'tag_id'
    t.string 'taggable_type'
    t.uuid 'taggable_id'
    t.string 'tagger_type'
    t.bigint 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at', precision: nil
    t.string 'tenant', limit: 128
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx',
                                                                                unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'taggings_taggable_context_idx'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index %w[taggable_type taggable_id], name: 'index_taggings_on_taggable_type_and_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
    t.index %w[tagger_type tagger_id], name: 'index_taggings_on_tagger_type_and_tagger_id'
    t.index ['tenant'], name: 'index_taggings_on_tenant'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
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
  add_foreign_key 'company_industries', 'companies'
  add_foreign_key 'company_industries', 'industries'
  add_foreign_key 'company_roles', 'companies'
  add_foreign_key 'company_roles', 'jobs'
  add_foreign_key 'company_roles', 'role_types'
  add_foreign_key 'company_specialities', 'companies'
  add_foreign_key 'company_specialities', 'specialities'
  add_foreign_key 'connection_requests', 'companies'
  add_foreign_key 'connection_requests', 'employees'
  add_foreign_key 'conversations', 'companies'
  add_foreign_key 'conversations', 'employees'
  add_foreign_key 'countries', 'currencies'
  add_foreign_key 'employee_levels', 'employees'
  add_foreign_key 'employee_levels', 'role_levels'
  add_foreign_key 'employee_roles', 'employees'
  add_foreign_key 'employee_roles', 'role_types'
  add_foreign_key 'employees', 'primary_roles'
  add_foreign_key 'employees', 'users'
  add_foreign_key 'follows', 'companies'
  add_foreign_key 'follows', 'employees'
  add_foreign_key 'job_countries', 'countries'
  add_foreign_key 'job_countries', 'jobs'
  add_foreign_key 'jobs', 'companies'
  add_foreign_key 'jobs', 'job_boards'
  add_foreign_key 'jobs', 'users'
  add_foreign_key 'open_roles', 'employees'
  add_foreign_key 'open_roles', 'primary_roles'
  add_foreign_key 'preferred_locations', 'location_types'
  add_foreign_key 'primary_roles', 'categories'
  add_foreign_key 'salaries', 'currencies'
  add_foreign_key 'skillables', 'skills'
  add_foreign_key 'skills', 'categories'
  add_foreign_key 'taggings', 'tags'
end
