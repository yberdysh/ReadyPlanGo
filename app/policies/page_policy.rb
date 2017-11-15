class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def destination_select
    true
  end
end
