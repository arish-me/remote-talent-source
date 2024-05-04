# frozen_string_literal: true

# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  def index
    @pagy, @notifications = pagy(current_user.notifications.includes(event: :record).newest_first)
  end

  def show
    @notification = current_user.notifications.find(params[:id])
    @notification.mark_as_read!
  end

  def mark_all_as_read
    current_user.notifications.unread.update_all(read_at: Time.zone.now)
    redirect_to notifications_path, notice: t('.notice')
  end
end
