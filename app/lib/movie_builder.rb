class MovieBuilder
  class << self
    def build(raw_data)
      {
        name: raw_data[:name],
        description: raw_data[:description],
        year: raw_data[:year],
        directors: raw_data[:directors],
        actors: raw_data[:actors],
        countries: raw_data[:countries],
        filming_locations: raw_data[:filming_locations]
      }
    end
  end
end