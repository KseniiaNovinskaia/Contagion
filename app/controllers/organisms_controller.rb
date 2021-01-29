class OrganismsController < ApplicationController
  def index
    initialize_search
    handle_search_name
    # handle_filters
  end

  def show
    authorize @organism = Organism.find(params[:id])
    # @organism = Organism.find(params[:organism_id])
    @infection = Infection.new
    # authorize @infection
  end

  private

  # for the searchbar and filters, found here: https://medium.com/better-programming/making-a-search-and-filter-function-in-rails-a7858987f6f6
  def initialize_search
    @organisms = policy_scope(Organism)
    session[:search_name] = params[:search_name] # 'session[:search_name] ||= params[:search_name]' didn't work
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end

  def handle_search_name
    if session[:search_name] != ""
      @organisms = Organism.where("name LIKE ?", "%#{session[:search_name].titleize}%")
      # @teams = @teams.where(code: @players.pluck(:team)) <-- from the tutorial
    else
      @organisms = Organism.all
    end
  end

  # def handle_filters
  #   # raise
  #   if session[:filter_option] && session[:filter] == "position"
  #     @players = @players.where(position: session[:filter_option])
  #     @teams = @teams.where(code: @players.pluck(:team))
  #   elsif session[:filter_option] && session[:filter] == "team"
  #     @teams = @teams.where(code: session[:filter_option])
  #   end
  # end
end
