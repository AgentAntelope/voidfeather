class Character

  def initialize(attributes)
    @attributes = attributes
  end

  def race
    @race ||= attributes[name]["Race"]
  end

  def secrets
    @secrets ||= attributes[name]["Secrets"]
  end

  def keys
    @keys ||= attributes[name]["Keys"]
  end

  def traits
    return @traits if @traits.present?
    @traits = []
    attributes[name]["Traits"].map do |trait_attrs|
      @traits << Trait.new(trait_attrs)
    end

    @traits
  end

  def name
    @name ||= attributes.keys.first
  end

  private

  attr_reader :attributes
  
end
