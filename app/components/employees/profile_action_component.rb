# frozen_string_literal: true

module Employees
  class ProfileActionComponent < ApplicationComponent
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def update_profile?
      user&.employee
    end
  end
end
