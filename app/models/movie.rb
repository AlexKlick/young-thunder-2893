class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors, :dependent => :destroy
  has_many :actors, through: :movie_actors

  def actors_ordered_age
    actors.order(age: :asc)
  end

  def self.worked_with
    joins(:actors)
    .pluck('actors.name')
    .uniq
  end
end