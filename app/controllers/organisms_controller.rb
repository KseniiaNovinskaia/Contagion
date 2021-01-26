class OrganismsController < ApplicationController
  def index
    @organisms = policy_scope(Organism)
  end
end
