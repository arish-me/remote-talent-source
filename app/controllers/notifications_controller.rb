# frozen_string_literal: true

class NotificationsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!

  def index
    @pagy, @notifications = pagy(current_user.notifications.includes(event: :record).newest_first)
  end

  def show
    notification = current_user.notifications.find(params[:id])
    notification.mark_as_read!

    if (url = notification.to_notification.url)
      redirect_to url
    else
      redirect_to notifications_path, notice: t('.notice')
    end
  end

  def mark_all_as_read
    current_user.notifications.unread.update_all(read_at: Time.zone.now)
    redirect_to notifications_path, notice: t('.notice')
  end
end
