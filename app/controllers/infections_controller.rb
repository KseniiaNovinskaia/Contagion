class InfectionsController < ApplicationController
  def edit
    @infection = Infection.find(params[:id])
  end

  def update
    @infection = Infection.find(params[:id])
    @infection.update(infection_params)
  end

  private
  # We will probably have a merge conflict here, but that's fine, we'll just
  # keep one of the two versions. I need to create it so that I can test my stuff
  def infection_params
    params.require(:infection).permit()
  end
end
