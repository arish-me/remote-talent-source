# frozen_string_literal: true

module Admin
  # services/admin/job_board_service.rb
  class JobBoardService
    JOB_BOARDS = {
      remote_ok: {
        name: 'Remote OK',
        api_url: 'https://remoteok.com/api',
        logo_url: nil
      }
    }.freeze
    def call
      seed_boards
    end

    def seed_boards
      JOB_BOARDS.each_value do |job_board_data|
        job_board = JobBoard.find_or_initialize_by(name: job_board_data[:name])
        job_board.update(api_url: job_board_data[:api_url], logo_url: job_board_data[:logo_url])

        puts "Job board '#{job_board_data[:name]}' has been seeded."
      end
    end
  end
end
