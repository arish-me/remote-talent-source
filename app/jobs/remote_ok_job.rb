# frozen_string_literal: true

require 'sidekiq-scheduler'

class RemoteOkJob
  include Sidekiq::Worker

  def perform
    RemoteOkService.new.call
  end
end
