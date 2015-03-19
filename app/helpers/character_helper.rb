module CharacterHelper
  def specialization?(tag)
    return false unless tag
    tag.include?('Specialization')
  end
end
