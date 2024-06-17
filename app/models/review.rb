class Review
  include Mongoid::Document

  field :username, type: String
  field :stars, type: Integer
  field :body, type: String

  belongs_to :movie, counter_cache: true
end