class InfectionsController < ApplicationController
  def edit
    @infection = Infection.find(params[:id])
    @organism = Organism.find(params[:organism_id])
    authorize @infection
  end

  def update
    @infection = Infection.find(params[:id])
    @infection.update(infection_params)
    redirect_to organisms_path # this can later be changed so that the redirect
    # leads to the dashboard or something
  end

  private
  # We will probably have a merge conflict here, but that's fine, we'll just
  # keep one of the two versions. I need to create it so that I can test my stuff
  def infection_params
    params.require(:infection).permit(:status)
    # I might have to add the organsim_id or something here. There was something
    # about that in our last project I think.
  end
end
