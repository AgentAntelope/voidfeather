class Character

  def initialize(attributes)
    @attributes = attributes
  end

  def race
    @race ||= attributes[name]["Race"]
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

    @traits.sort! {|trait| trait.tags.size}
  end

  def name
    @name ||= attributes.keys.first
  end

  private

  attr_reader :attributes

end
