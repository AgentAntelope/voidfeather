class Planet

  def initialize(attributes)
    @attributes = attributes
  end

  def description
    @description ||= attributes[name]["Description"]
  end

  def notable_people
    @notable_people ||= attributes[name]["Notable people"]
    @notable_people || []
  end

  def noteworthy_places
    @noteworthy_places ||= attributes[name]["Noteworthy places"]
    @noteworthy_places || []
  end

  def name
    @name ||= attributes.keys.first
  end

  private

  attr_reader :attributes
end
