class MoviesController < ApplicationController
  OFFSET_MAX    = 10000
  PAGE_SIZE_MAX = 200

  def index
    offset = params[:offset].present? ? [params[:offset].to_i, OFFSET_MAX].min : 0
    limit = params[:limit].present? ? [params[:limit].to_i, PAGE_SIZE_MAX].min : 10

    render json: Movie.filters(filter_params).offset(offset).limit(limit)
  end

  def filter_params
    params.permit(:directors, :actors, :filming_locations, :countries)
  end
end
