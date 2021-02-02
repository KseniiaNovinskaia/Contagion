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

  def initialize_search
    @organisms = policy_scope(Organism)
    session[:search_name] = params[:search_name]
    session[:search_species] = params[:search_species]
    session[:search_body_temperature] = params[:search_body_temperature]
    session[:search_age] = params[:search_age]
  end

  def handle_search_name
    # name = session[:search_name]
    species = session[:search_species]
    body_temperature = session[:search_body_temperature]
    age = session[:search_age]
    @organisms = Organism.all
    # @organisms = @organisms.search_by_name(name) unless name.blank?
    @organisms = @organisms.select { |organism| species.include?(organism.species) } unless species.blank?
    @organisms = @organisms.select { |organism| organism.body_temperature <= body_temperature.to_i } unless body_temperature.blank?
    @organisms = @organisms.select { |organism| organism.age <= age.to_i } unless age.blank?
  end
end
