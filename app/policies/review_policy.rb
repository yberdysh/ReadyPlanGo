class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    if record.user == user
     true
    else
     false
    end
  end

  def update?
    if record.user == user
      true
    else
      false
    end
  end

  def destroy?
    if record.user == user
      true
    else
      false
    end
  end
end
