class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_characters

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
