# frozen_string_literal: true

class JobPolicy < ApplicationPolicy
  def index?
    job_access?
  end

  def new?
    job_access?
  end

  def create?
    record_owner? || admin?
  end

  def update?
    record_owner? || admin?
  end

  def show?
    record_owner? || admin?
  end

  def destroy?
    record_owner? || admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
