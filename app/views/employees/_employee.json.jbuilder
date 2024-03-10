# frozen_string_literal: true

json.extract! employee, :id, :first_name, :last_name, :primary_role_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
