class Movie
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Filterable

  filterable_by :directors, :actors, :filming_locations, :countries

  field :name, type: String
  field :description, type: String
  field :year, type: Integer
  field :directors, type: Array
  field :actors, type: Array
  field :filming_locations, type: Array
  field :countries, type: Array

  has_many :reviews
end