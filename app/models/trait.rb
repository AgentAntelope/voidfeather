class Trait
  def initialize(attributes)
    @attributes = attributes
  end

  def tags
    @tags ||= attributes[title]["Tags"]
  end

  def title
    @title ||= attributes.keys.first
  end

  private

  attr_reader :attributes
end
