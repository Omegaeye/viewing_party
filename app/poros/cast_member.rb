class CastMember
  attr_reader :name, :character, :profile_path
  def initialize(data)
    @name = data[:name]
    @character = data[:character]
    @profile_path = data[:profile_path]
  end
end
