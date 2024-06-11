# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :sender, polymorphic: true, touch: true
  has_one :employee, through: :conversation
  has_one :company, through: :conversation
  validates :content, presence: true
  validates :agree_terms, acceptance: true

  def deleted_sender?
    sender.nil?
  end

  def sender?(user)
    sender.user.id == user.id
  end

  def recipient
    if sender == employee
      company.user
    elsif sender == company
      employee.user
    end
  end

  def do_broadcast
    broadcast_append_to conversation, target: 'messages', partial: 'messages/message',
                                      locals: { message: self, current_user: recipient }
  end
end
