Actor.destroy_all
Studio.destroy_all
Movie.destroy_all
universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

@studio = Studio.create(name:"Warner Bros", location:"Hollywood, CA")
@movie1 = Movie.create(title:"The Matrix", creation_year:1999, genre:"Sci-Fi", studio_id: @studio.id)
@movie2 = Movie.create(title:"Inception", creation_year:2010, genre:"Sci-Fi", studio_id: @studio.id)
@movie3 = Movie.create(title:"The Matrix Reloaded", creation_year:2002, genre:"Sci-Fi", studio_id: @studio.id)
@actor1 = Actor.create(name:"Lawrence Fishbourne", age:59)
@actor2 = Actor.create(name:"Keanu Reeves", age:56)
@actor3 = Actor.create(name:"Gloria Foster", age:67)
@actor4 = Actor.create(name:"Jada Pinkett Smith", age:49)
amove1 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor1.id)
amove2 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor2.id)
amove3 = MovieActor.create(movie_id: @movie1.id, actor_id:@actor3.id)
amove4 = MovieActor.create(movie_id: @movie3.id, actor_id:@actor2.id)
amove5 = MovieActor.create(movie_id: @movie3.id, actor_id:@actor4.id)