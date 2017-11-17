class DestinationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

  end

  def new?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def edit?
    if record.user == current_user
     true
    else
     false
    end
  end
end
