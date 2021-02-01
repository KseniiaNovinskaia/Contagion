class OrganismsController < ApplicationController
  def index
    initialize_search
    handle_search_name
  end

  def show
    authorize @organism = Organism.find(params[:id])
    # @organism = Organism.find(params[:organism_id])
    @infection = Infection.new
    # authorize @infection
  end

  private

  # for the searchbar, found here: https://medium.com/better-programming/making-a-search-and-filter-function-in-rails-a7858987f6f6
  def initialize_search
    @organisms = policy_scope(Organism)
    session[:search_name] = params[:search_name] # 'session[:search_name] ||= params[:search_name]' didn't work
    session[:search_species] = params[:search_species]
  end

  # we probably want to refactor this after the lecture on search bars
  def handle_search_name
    name = session[:search_name]
    species = session[:search_species]
    if name.blank? && species.blank?
      @organisms = Organism.all
    # else
    #   @organisms = Organism.where("name @@ :query OR species @@ :query",
    #                               query: "%#{session[:search_name]}%")
    elsif name.present? && species.blank?
      @organisms = Organism.where("name @@ ?",
                                  "%#{session[:search_name]}%")
    elsif name.blank? && species.present?
      @organisms = Organism.where("species @@ ?",
                                  session[:search_species])
    else
      @organisms = Organism.where("name @@ ? AND species @@ ?",
                                  "%#{session[:search_name]}%",
                                  session[:search_species])
    end
  end
end
