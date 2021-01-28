class OrganismPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # every logged in user can see all organisms
    end
  end
    def show?
    true
  end

end
