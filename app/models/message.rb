class Message < ApplicationRecord
  belongs_to :conversation, optional: true
  belongs_to :sender, polymorphic: true, touch: true
  has_one :employee, through: :conversation
  has_one :company, through: :conversation

  def deleted_sender?
    sender.nil?
  end

  def sender?(user)
    [user.employee, user.company].include?(sender)
  end

  def recipient
    if sender == employee
      company
    elsif sender == company
      employee
    end
  end

  def do_broadcast
    broadcast_append_to conversation, locals: { message: self }
  end
end
