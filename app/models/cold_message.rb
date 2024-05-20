# frozen_string_literal: true

ColdMessage = Struct.new(:message, :show_hiring_fee_terms, keyword_init: true) do
  def developer
    message.conversation.employee
  end

  def business
    message.conversation.company
  end
end
