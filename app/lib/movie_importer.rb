class MovieImporter < Importer
  BATCH_IMPORT_SIZE = 1000

  def import
    CSV.foreach(csv_path, headers: true) do |row|
      movie_name       = row['Movie'].squish
      description      = row['Description'].squish
      year             = row['Year'].squish
      director         = row['Director']
      actor            = row['Actor']
      country          = row['Country']
      filming_location = row['Filming location']

      populated_items[movie_name] ||= {
        name: movie_name,
        description: description,
        year: year,
        directors: [],
        actors: [],
        countries: [],
        filming_locations: []
      }

      add_to_set(populated_items[movie_name][:directors], director)
      add_to_set(populated_items[movie_name][:actors], actor)
      add_to_set(populated_items[movie_name][:countries], country)
      add_to_set(populated_items[movie_name][:filming_locations], filming_location)

      check_import_threshold
    end

    import_remaining_to_database
  end

  def add_to_set(set, item)
    set << item unless set.include?(item)
  end

  def import_to_database
    prepared_statment = populated_items.values.map do |item|
      MovieBuilder.build(item)
    end

    Movie.create(prepared_statment)
  end
end