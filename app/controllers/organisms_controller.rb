class OrganismsController < ApplicationController
  def index
    # init_species
    # init_body_temperature
    # init_age
    initialize_search
    handle_search_name
    # raise
  end

  def show
    authorize @organism = Organism.find(params[:id])
    # @organism = Organism.find(params[:organism_id])
    @infection = Infection.new
    # authorize @infection
  end

  private

  def initialize_search
    @organisms = policy_scope(Organism)
    session[:search_name] = params[:search_name]
    session[:search_species] = params[:search_species]
    session[:search_body_temperature] = params[:search_body_temperature]
    session[:search_age] = params[:search_age]
  end

  def handle_search_name
    name = session[:search_name]
    species = session[:search_species]
    body_temperature = session[:search_body_temperature]
    age = session[:search_age]
    @organisms = Organism.all
    @organisms = @organisms.search_by_name(name) unless name.blank?
    @organisms = @organisms.select { |organism| species.include?(organism.species) } unless species.blank?
    @organisms = @organisms.select { |organism| organism.body_temperature <= body_temperature.to_i } unless body_temperature.blank?
    @organisms = @organisms.select { |organism| organism.age <= age.to_i } unless age.blank?
  end

  # def init_species
  #   @species = []
  #   Organism.all.each do |organism|
  #     @species << organism.species unless @species.include?(organism.species)
  #   end
  #   @species.sort!
  # end

  # def init_body_temperature
  #   body_temperatures = []
  #   Organism.all.each do |organism|
  #     body_temperatures << organism.body_temperature unless body_temperatures.include?(organism.body_temperature)
  #   end
  #   body_temperatures.sort!
  #   @min_body_temperature = body_temperatures.first
  #   @max_body_temperature = body_temperatures.last
  #   @mid_body_temperature = (@min_body_temperature + @max_body_temperature) / 2
  # end

  # def init_age
  #   ages = []
  #   Organism.all.each do |organism|
  #     ages << organism.age unless ages.include?(organism.age)
  #   end
  #   ages.sort!
  #   @min_age = ages.first
  #   @max_age = ages.last
  #   @mid_age = (@min_age + @max_age) / 2
  # end
end
