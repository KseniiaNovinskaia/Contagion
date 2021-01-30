class InfectionsController < ApplicationController
  def index
    @infections = policy_scope(Infection)
  end

  def create
    @organism = Organism.find(params[:organism_id])
    @infection = Infection.new(infection_params)
    @infection.organism = @organism
    @infection.user = current_user
    authorize @infection
    @infection.save
    flash[:alert] = "Infection is confirmed!"
    redirect_to organism_path(@organism)
  end

  # def edit
  #   @infection = Infection.find(params[:id])
  #   @organism = Organism.find(params[:organism_id])
  #   authorize @infection
  # end

  def cancel
    @infection = Infection.find(params[:id])
    @infection.status = "cancelled"
    @infection.save
    redirect_to infections_path # this can later be changed so that the redirect
    # leads to the dashboard or something
    authorize @infection
  end

  private

  # We will probably have a merge conflict here, but that's fine, we'll just
  # keep one of the two versions. I need to create it so that I can test my stuff
  def infection_params
    params.require(:infection).permit(:status, :infection_start, :infection_end)
    # I might have to add the organsim_id or something here. There was something
    # about that in our last project I think.
  end
end
