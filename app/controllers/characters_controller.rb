# frozen_string_literal: true
class CharactersController < ApplicationController

  def show
    @character = @characters.detect {|character| character.name == params[:id]}
  end
end
