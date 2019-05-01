class Api::V1::MoviesController < Api::V1::ApiController

  def index
    @movies = Movie.all
    render json: @movies, each_serializer: Api::V1::MovieSerializer
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie, serializer: Api::V1::MovieSerializer
  end
end