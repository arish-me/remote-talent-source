# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include AASM

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable, :trackable, :lockable

  enum role: [:user, :employee, :company, :admin]

  aasm column: 'current_state' do
    state :pending, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: [:pending, :inactive], to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end
  end
end
