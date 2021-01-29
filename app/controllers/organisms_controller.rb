class OrganismsController < ApplicationController
  def index
    @organisms = policy_scope(Organism)
  end

  def show
    authorize @organism = Organism.find(params[:id])
    # @organism = Organism.find(params[:organism_id])
    @infection = Infection.new
    # authorize @infection
  end
end
