class CharactersController < ApplicationController

  def show
    @character = @characters.detect {|character| character.name == params[:id]}
  end
end
