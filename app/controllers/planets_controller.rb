class PlanetsController < ApplicationController

  def show
    @planet = @planets.detect {|planet| planet.name == params[:id]}
  end
end
