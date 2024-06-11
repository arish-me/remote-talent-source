# frozen_string_literal: true

class ColdMessagesController < ApplicationController
  before_action :authenticate_user!
  #before_action :require_business!
  before_action :require_new_conversation!
  # before_action :require_active_subscription!
  # before_action :require_signed_hiring_agreement!

  def new
    message = Message.new(conversation:)
    @cold_message = cold_message(message)
  end

  def create
    message = Message.new(message_params.merge(conversation:, sender: company))
    if message.save
      redirect_to message.conversation
    else
      @cold_message = cold_message(message)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cold_message(message)
    ColdMessage.new(message:)
  end

  def require_business!
    return if company.present?

    #store_location!
    redirect_to new_company_path, notice: I18n.t('errors.business_blank')
  end

  def require_new_conversation!
    redirect_to conversation unless conversation.new_record?
  end

  # def require_active_subscription!
  #   return if permissions.active_subscription?

  #   store_location!
  #   redirect_to pricing_path
  # end

  def require_signed_hiring_agreement!
    return unless current_user.needs_to_sign_hiring_agreement?

    store_location!
    redirect_to new_hiring_agreement_signature_path, notice: I18n.t('errors.hiring_agreements.cold_message')
  end

  # def permissions
  #   @permissions = current_user.permissions
  # end

  def conversation
    debugger
    @conversation ||= Conversation.find_or_initialize_by(employee:, company:)
  end

  def employee
    @employee ||= Employee.find(params[:employee_id])
  end

  def company
    @business = current_user.company
  end

  def message_params
    params.require(:message).permit(:content, :agree_terms)
  end
end
