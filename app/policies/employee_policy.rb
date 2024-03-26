# frozen_string_literal: true

class EmployeePolicy < ApplicationPolicy
  def index?
    admin?
  end

  def update?
    record_owner?
  end

  def show?
    record_owner? || admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
