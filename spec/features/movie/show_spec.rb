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
    amove4 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor2.id)
    amove5 = ActorMovie.create(movie_id: @movie3.id, actor_id:@actor4.id)

    visit "/movies/#{@movie1.id}"

  end

#   As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

  it 'has the movie title, creation year and genre' do
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)
    #test has only this movie 
    expect(page).to_not have_content(@movie2.title)
    expect(page).to_not have_content(@movie3.title)
  end

  it 'has the actors listed from youngest to oldest' do
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor3.name)
    #doesn't have actor 4 in movie
    expect(page).to_not have_content(@actor4.name)
  end

  it 'has the average age of all of the actors' do
    expect(page).to have_content("Average age of actors: #{(@actor1.age + @actor2.age + @actor3.age) / 3}")
  end

# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)

  it 'does not have actors not in the movie' do
    expect(page).to_not have_content(@actor4.name)
  end

  it 'has a form to add an actor, which allows to add actors that exist to the movie' do
    fill_in 'name', with: 'Jada Pinkett Smith'
    click_on 'commit'
    expect(current_path).to eq("/movies/#{@movie1.id}")
    expect(page).to have_content(@actor4.name)
  end
end