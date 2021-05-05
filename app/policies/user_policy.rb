class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def welcome?
    true
  end

  def login?
    true
  end

  def register?
    true
  end
end
