class ActorsController < ApplicationController
  def show
    @actor = Actor.find(actor_params[:id])
    @worked_with = @actor.movies.worked_with
    @worked_with.delete(@actor.name)
  end

  private

  def actor_params
    params.permit(:id)
  end
end