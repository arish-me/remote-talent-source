# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include AASM

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :confirmable, :trackable, :lockable

  enum role: %i[user employee company admin]

  has_one :employee, dependent: :destroy
  has_one :company, dependent: :destroy

  has_many :jobs, dependent: :destroy

  aasm column: 'current_state' do
    state :pending, initial: true
    state :active
    state :inactive

    event :activate do
      transitions from: %i[pending inactive], to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end
  end

  scope :search, lambda { |query|
    query = "%#{query}%"
    left_outer_joins(:employee, :company)
      .where('email ILIKE ?', query)
  }
end
