class MoviesController < ApplicationController
  def show
    @movie = Movie.find(movie_params[:id])
    @actors = @movie.actors_ordered_age
    @all_actors = Actor.all
    @average_age = @actors.average_stat('age')
  end

  private

  def movie_params
    params.permit(:id)
  end
end