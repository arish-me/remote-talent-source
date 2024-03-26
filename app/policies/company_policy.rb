class CompanyPolicy < ApplicationPolicy
  def index?
    admin?
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
    admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
