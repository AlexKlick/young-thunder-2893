class MovieActorsController < ApplicationController
  def create
    #check if actor exists
    if Actor.find(movie_actor_params[:actor_id]) 
      #test to see if movie_actor already exists 
      if MovieActor.where('actor_id = ?', movie_actor_params[:actor_id]).where('movie_id = ?', movie_actor_params[:movie_id]) == []
        MovieActor.create(movie_actor_params)
      end
    end
    redirect_to "/movies/#{movie_actor_params[:movie_id]}"
  end

  private

  def movie_actor_params
    if params[:id]
      params[:movie_id] = params.delete :id
    end
    params[:actor_id] = Actor.where('name = ?', params[:name]).first.id
    params.permit(:movie_id, :actor_id)
  end
end