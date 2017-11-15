class UsersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show
    true
  end
  def edit
    true
  end

  def update
    true
  end
end
