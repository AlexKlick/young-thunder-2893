require 'rails_helper'

RSpec.describe Actor do
describe 'relationships' do
  it {should have_many :movie_actors}
  it {should have_many :movies}
end

describe 'class methods' do

end
describe 'instance methods' do

end
end