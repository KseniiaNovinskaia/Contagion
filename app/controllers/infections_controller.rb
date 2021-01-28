class InfectionsController < ApplicationController

  # def new
  # end

  def create
    @organism = Organism.find(params[:organism_id])
    @infection = Infection.new(infection_params)
    @infection.organism = @organism
    if @infection.save
      redirect_to organism_path(@organism)
    else
      render "infections/show"
    end
  end

  private

  def infection_params
    params.require(:infection).permit(:infection_start, :infection_end)
  end
end
