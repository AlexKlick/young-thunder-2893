require 'rails_helper'
describe 'studio index page' do 
  before(:each) do
    @disney = Studio.create!(name:'Disney',location:"Hollywood")
    @fox = Studio.create!(name:'Fox',location:"Hollywood")
    @fox.movies.create!(title:"The Matrix" , creation_year:1999, genre:"cyberpunk")
    @fox.movies.create!(title:"The Matrix Reloaded" , creation_year:2003, genre:"cyberpunk")
    @disney.movies.create!(title:"Toy Story" , creation_year:1995, genre:"kids")
    @disney.movies.create!(title:"Pirates of the Caribbean" , creation_year:2003, genre:"adventure")
    visit '/studios'
  end
  # As a user,
  # When I visit the studio index page
  # I see a each studio's name and location
  # And underneath each studio, I see the titles of all of its movies.
  it 'has each studios name and location and the title of all of its movies' do
    expect(page).to have_content(@disney.name)
    expect(page).to have_content(@disney.location)
    expect(page).to have_content(@fox.name)
    expect(page).to have_content(@fox.location)
    expect(page).to have_content(@fox.movies[0].title)
    expect(page).to have_content(@fox.movies[1].title)
    expect(page).to have_content(@disney.movies[0].title)
    expect(page).to have_content(@disney.movies[1].title)
  end


end