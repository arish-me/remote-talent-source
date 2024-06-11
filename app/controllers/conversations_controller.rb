# frozen_string_literal: true

class ConversationsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!

  def index
    @pagy, @user_conversations = pagy(current_user.conversations.order(updated_at: :desc))
  end

  def show
    @user_conversations = current_user.conversations.order(updated_at: :desc)
    @conversation = conversation
    @message = Message.new(conversation: @conversation)
    # @conversation.mark_notifications_as_read(current_user)
  end

  private

  def conversation
    @conversation ||= Conversation.find(params[:id])
  end
end
