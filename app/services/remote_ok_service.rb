# frozen_string_literal: true

require 'net/http'
require 'json'

class RemoteOkService
  def find_board
    @board = JobBoard.find_by(name: 'Remote OK')
  end

  def initialize
    @last_updated = Time.now.utc
  end

  def call
    find_board
    fetch_jobs
  end

  def fetch_jobs
    uri = URI(@board.api_url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    save_jobs(response)
  rescue JSON::ParserError => e
    raise "Failed to parse jobs: #{e.message}"
  rescue StandardError => e
    raise "Failed to fetch jobs: #{e.message}"
  end

  private

  def save_jobs(jobs)
    processed_jobs_count = 0
    saved_jobs_count = 0
    @last_updated = Time.at(jobs.first['last_updated'])
    last_run_at = @board.last_run_at || Time.at(0)
    Rails.logger.info("Job Board Last Updated Time #{@board.name} : #{@last_updated}")

    return if @last_updated < last_run_at

    jobs.each_with_index do |job_data, _index|
      next if avoid_loop(job_data)

      processed_jobs_count += 1

      job = Job.find_or_initialize_by(source_id: job_data['id'])

      next if job.persisted?

      job.assign_attributes(
        title: job_data['position'],
        apply_url: job_data['apply_url'],
        worldwide: job_data['location'].blank? || job_data['location'].downcase == 'worldwide',
        source_name: job_data['company'],
        source_logo: process_company_logo(job_data['logo']),
        job_board_id: @board.id,
        # badges: job_data['tags'] || [],

        publish_date: DateTime.parse(job_data['date']),
        job_type: 1,
        position: job_data['position'],
        slug: job_data['slug'],
        description: job_data['description'],
        current_state: 'active',
        country_ids: country(job_data)&.id,
        salary_attributes: {
          min: job_data['salary_min'],
          max: job_data['salary_max'],
          salary_type: 0,
          currency_id: Currency.default_currency.id
        },
        preferred_location_attributes: {
          locatable_type: 'Job',
          location_type_id: preferred_location.id
        }
      )

      # Ensure tags are unique
      unique_tags = (job_data['tags'] || []).map(&:strip).map(&:downcase).uniq
      job.tag_list = unique_tags

      begin
        saved_jobs_count += 1 if job.save!
      rescue ActiveRecord::RecordInvalid => e
        puts "Failed to save job #{job_data['id']}: #{e.message}"
      end
    end
    update_job_board
    puts "Total jobs processed: #{processed_jobs_count}"
    puts "Total jobs saved: #{saved_jobs_count}"
  rescue StandardError => e
    Rails.logger.error("Failed to fetch jobs: #{e.message}")
  end

  def avoid_loop(job_data)
    job_data['id'].nil? ||
      job_data['salary_min'].to_i <= 0 || job_data['salary_max'].to_i <= 0 ||
      job_data['logo'].blank? || process_company_logo(job_data['logo']).nil?
  end

  def update_job_board
    @board.update(last_updated_at: @last_updated, last_run_at: Time.now.utc)
  end

  def process_company_logo(url)
    return if url.blank?

    begin
      processed_image = ImageProcessor.process(url)
      processed_image_path = Rails.root.join('public', 'uploads', 'company_logos', "#{SecureRandom.uuid}.jpg")
      FileUtils.mkdir_p(File.dirname(processed_image_path))
      File.binwrite(processed_image_path, processed_image.read) # Use binwrite to handle binary data

      processed_image_path.to_s.gsub(Rails.root.join('public').to_s, '')
    rescue StandardError => e
      Rails.logger.error("Failed to process company logo: #{e.message}")
      nil
    end
  end

  def preferred_location
    LocationType.find_by(name: 'remote')
  end

  def country(job_data)
    Country.find_by(name: job_data['location']&.split(', ')&.last)
  end

  def default_currency
    Currency.default_currency
  end
end
