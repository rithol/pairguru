class Api::V2::MoviesController < Api::V1::ApiController

  def index
    @movies = Movie.includes(:genre).all
    render json: @movies, each_serializer: Api::V2::MovieSerializer
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: Api::V2::MovieSerializer
  end
end