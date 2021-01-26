class OrganismsController < ApplicationController
  def index
    @organisms = policy_scope(Organism)
  end

  def show
    authorize @organism = Organism.find(params[:id])
  end
end
