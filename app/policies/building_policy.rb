class BuildingPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end

    def index?
      false
    end

    def create?
      user.admin?
    end

    def new?
      user.admin?
    end

    def edit?
      user.admin?
    end

  end
end
