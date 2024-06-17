class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    render json: @movie.reviews.order_by(stars: :desc)
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
