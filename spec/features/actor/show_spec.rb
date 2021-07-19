require 'rails_helper'
describe 'movie show page' do 
  before(:each) do
    @studio = Studio.create(name:"Warner Bros", location:"Hollywood, CA")
    @movie1 = Movie.create(title:"The Matrix", creation_year:1999, genre:"Sci-Fi", studio_id: @studio.id)
    @movie2 = Movie.create(title:"Inception", creation_year:2010, genre:"Sci-Fi", studio_id: @studio.id)
    @movie3 = Movie.create(title:"The Matrix Reloaded", creation_year:2002, genre:"Sci-Fi", studio_id: @studio.id)
    @actor1 = Actor.create(name:"Lawrence Fishbourne", age:59, currently_working:true)
    @actor2 = Actor.create(name:"Keanu Reeves", age:56, currently_working:true)
    @actor3 = Actor.create(name:"Gloria Foster", age:67, currently_working:false)
    @actor4 = Actor.create(name:"Jada Pinkett Smith", age:49, currently_working:true)
    amove1 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor1.id)
    amove2 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor2.id)
    amove3 = ActorMovie.create(movie_id: @movie1.id, actor_id:@actor3.id)
    amove4 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor1.id)
    amove5 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor4.id)

    visit "/actors/#{@actor1.id}"
  end

  # As a user,
  # When I visit an actor's show page
  # I see that actors name and age 
  # And I see a unique list of all of the actors this particular actor has worked with.

  it 'has the actors name and age' do 
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor1.age)
  end

  it 'has a unique list of all of the actors who have worked with this actor' do
    within('div#worked_with') do
      expect(page).to have_content(@actor2.name, count:1)
      expect(page).to have_content(@actor3.name, count:1)
      expect(page).to have_content(@actor4.name, count:1)
    end
  end
end