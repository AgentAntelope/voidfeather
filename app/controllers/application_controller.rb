class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_characters
  before_filter :load_planets
  before_filter :hipku

  private

  def hipku
    @hipku = Hipku.encode(request.ip).split("\n")
  end

  def load_characters
    return @characters if @characters.present?

    @characters = []

    YAML.load(File.open('config/characters.yml')).each do |character|
      @characters << Character.new(character)
    end

    @characters.sort! {|a,b| a.normalized_name <=> b.normalized_name}
  end

  def load_planets
    return @planets if @planets.present?

    @planets = []

    YAML.load(File.open('config/planets.yml')).each do |planet|
      @planets << Planet.new(planet)
    end

    @planets.sort! {|a,b| a.normalized_name <=> b.normalized_name}
  end
end
