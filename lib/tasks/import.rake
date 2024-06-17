namespace :import do
  desc "Import movies collection"
  task movies: [:environment] do
    MovieImporter.import Rails.root.join('tmp', 'movies.csv')

    puts "|> Movies imported successfully!"
  end

  desc "Import reviews collection"
  task reviews: [:environment] do
    ReviewImporter.import Rails.root.join('tmp', 'reviews.csv')

    puts "|> Reviews imported successfully!"
  end
end
