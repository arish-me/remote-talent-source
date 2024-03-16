# frozen_string_literal: true

json.extract! company, :id, :user_id, :name, :company_email, :phone, :website, :size, :industry, :created_at,
              :updated_at
json.url company_url(company, format: :json)
