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

  def new
    authorize @organism = Organism.new
  end

  def create
    @organism = Organism.new(organism_params)
    @organism.user = current_user
    authorize @organism
    @organism.save
    redirect_to dashboard_path
  end

  private

  def organism_params
    params.require(:organism).permit(:name, :body_temperature, :age, :species)
  end
  # for the searchbar, found here: https://medium.com/better-programming/making-a-search-and-filter-function-in-rails-a7858987f6f6
  def initialize_search
    @organisms = policy_scope(Organism)
    session[:search_name] = params[:search_name] # 'session[:search_name] ||= params[:search_name]' didn't work
    session[:search_species] = params[:search_species]
  end

  # we probably want to refactor this after the lecture on search bars
  def handle_search_name
    if (session[:search_name].nil? || session[:search_name].empty?) &&
       (session[:search_species].nil? || session[:search_species].empty?)
      @organisms = Organism.all
    elsif !session[:search_name].empty? && session[:search_species].empty?
      @organisms = Organism.where("name LIKE ?",
                                  "%#{session[:search_name].titleize}%")
    elsif session[:search_name].empty? && !session[:search_species].empty?
      @organisms = Organism.where("species = ?",
                                  session[:search_species])
    else
      @organisms = Organism.where("name LIKE ? AND species = ?",
                                  "%#{session[:search_name].titleize}%",
                                  session[:search_species])
    end
  end
end
