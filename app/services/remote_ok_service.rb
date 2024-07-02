# frozen_string_literal: true

require 'net/http'
require 'json'

class RemoteOkService
  REMOTE_OK_API_URL = 'https://remoteok.com/api'
  def fetch_jobs
    uri = URI(REMOTE_OK_API_URL)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue JSON::ParserError => e
    raise "Failed to parse jobs: #{e.message}"
  rescue StandardError => e
    raise "Failed to fetch jobs: #{e.message}"
  end
end
