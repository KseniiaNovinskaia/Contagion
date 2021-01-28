class InfectionsController < ApplicationController
  def new
    @organism = Organism.find(params[:organism_id])
    @infection = Infection.new
    authorize @infection
  end

  def create
    @organism = Organism.find(params[:organism_id])
    @infection = Infection.new(infection_params)
    @infection.organism = @organism
    @infection.user = current_user
    authorize @infection
    @infection.save
    redirect_to organism_path(@organism)
  end

  private

  def infection_params
    params.require(:infection).permit(:infection_start, :infection_end)
  end
end
