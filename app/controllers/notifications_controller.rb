# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  def index
    @pagy, @notifications = pagy(current_user.notifications.includes(event: :record).newest_first)
  end
end
