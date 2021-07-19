require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }

    it {should have_many :movie_actors}
    it {should have_many :actors}
  end

  describe 'instance methods' do
    before(:each) do
      @studio = Studio.create(name:"Warner Bros", location:"Hollywood, CA")
      @movie1 = Movie.create(title:"The Matrix", creation_year:1999, genre:"Sci-Fi", studio_id: @studio.id)
      @movie2 = Movie.create(title:"Inception", creation_year:2010, genre:"Sci-Fi", studio_id: @studio.id)
      @movie3 = Movie.create(title:"The Matrix Reloaded", creation_year:2002, genre:"Sci-Fi", studio_id: @studio.id)
      @actor1 = Actor.create(name:"Lawrence Fishbourne", age:59)
      @actor2 = Actor.create(name:"Keanu Reeves", age:56)
      @actor3 = Actor.create(name:"Gloria Foster", age:67)
      @actor4 = Actor.create(name:"Jada Pinkett Smith", age:49)
      @amove1 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor1.id)
      @amove2 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor2.id)
      @amove3 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor3.id)
      @amove4 = MovieActor.create(movie_id: @movie3.id, actor_id:@actor2.id)
      @amove5 = MovieActor.create(movie_id: @movie3.id, actor_id:@actor4.id)
  
    end
    describe '#actors_ordered_age' do
      it 'returns a movies actors, ordered by age yougnest first' do
        expect(@movie1.actors_ordered_age[0].name).to eq(@actor2.name)
        expect(@movie1.actors_ordered_age[1].name).to eq(@actor1.name)
        expect(@movie1.actors_ordered_age[2].name).to eq(@actor3.name)
      end
    end
  end
end