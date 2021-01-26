class OrganismsController < ApplicationController

  def index
  end

  def show
   authorize @organism = Organism.find(params[:id])
  end

end
