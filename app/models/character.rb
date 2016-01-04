# frozen_string_literal: true
class Character

  def initialize(attributes)
    @attributes = attributes
  end

  def race
    @race ||= attributes[name]["Race"]
  end

  def luck
    @luck ||= attributes[name]["Luck"]
  end

  def fine
    @fine ||= attributes[name]["Fine"] || 0
  end

  def secrets
    @secrets ||= attributes[name]["Secrets"]
    @secrets || []
  end

  def keys
    @keys ||= attributes[name]["Keys"]
    @keys || []
  end

  def traits
    return @traits if @traits.present?

    return [] unless attributes[name]["Traits"]

    @traits = []
    attributes[name]["Traits"].map do |trait_attrs|
      @traits << Trait.new(trait_attrs)
    end

    @traits.sort! {|a,b| a.tags.size <=> b.tags.size}
  end

  def name
    @name ||= attributes.keys.first
  end

  def normalized_name
    name.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '')
  end

  private

  attr_reader :attributes

end
