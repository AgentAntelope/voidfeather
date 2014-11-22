class CharactersController < ApplicationController

  before_filter :load_characters

  def show
    @character = @characters.detect {|character| character.name == params[:id]}
  end

  private

  def load_characters
    return @characters if @characters.present?

    @characters = []

    YAML.load(File.open('config/characters.yml')).each do |character|
      @characters << Character.new(character)
    end

    @characters
  end
end
