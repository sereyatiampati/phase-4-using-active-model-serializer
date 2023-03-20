class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies, methods: :summary
  end

  def show
    movie= set_movie
    render json: movie
  end

  def summary
    movie= set_movie
    render json: movie, serializer: MovieSummarySerializer
  end

  def summaries
    movies = Movie.all
    render json: movies, each_serializer: MovieSummarySerializer
  end

  private

  def set_movie
    Movie.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
