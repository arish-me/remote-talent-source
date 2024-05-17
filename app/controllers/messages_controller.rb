class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @message = Message.new(conversation:)
  end

  def create
    @message = Message.new(message_params.merge(conversation:, sender:))
    debugger
    if @message.save
      respond_to do |format|
        format.turbo_stream { @new_message = conversation.messages.build }
        format.html { redirect_to conversation }
      end
    else
      render 'conversations/show', status: :unprocessable_entity
    end
  end

  def conversation
    @conversation ||= Conversation.find_or_initialize_by(employee:, company:)
  end

  def employee
    @employee ||= Employee.find(params[:employee_id])
  end

  def company
    @company = current_user.company
  end

  def sender
    if current_user.company?
      current_user.company
    elsif current_user.employee?
      current_user.employee
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
