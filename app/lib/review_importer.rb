class ReviewImporter < Importer
  def import
    CSV.foreach(csv_path, headers: true) do |row|
      movie_name = row['Movie'].squish
      username   = row['User'].squish
      stars      = row['Stars'].squish
      body       = row['Review'].squish

      populated_items[movie_name] ||= [] 
      
      populated_items[movie_name] << {
        username: username,
        stars: stars,
        body: body
      }

      check_import_threshold
    end

    import_remaining_to_database
  end

  def import_to_database
    populated_items.each do |movie_name, reviews|
      movie = Movie.find_by(name: movie_name)
      next if movie.blank?
      movie.reviews.create(reviews)
    end
  end
end