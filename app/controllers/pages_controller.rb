class PagesController < ApplicationController

  def home
  end

  def dashboard
    @organisms = policy_scope(Organism)
    @infections = policy_scope(Infection)
  end

end
