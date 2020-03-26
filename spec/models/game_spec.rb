require 'rails_helper'

RSpec.describe Game, type: :model do

  it "is not valid without a title" do
    game = Game.new(title: nil)
    expect(game).to_not be_valid
  end

  it "is not valid without a genre" do
    game = Game.new(genre: nil)
    expect(game).to_not be_valid
  end

  it "is not valid without a rating" do
    game = Game.new(rating: nil)
    expect(game).to_not be_valid
  end

  it "is not valid without a release date" do
    game = Game.new(release_year: nil)
    expect(game).to_not be_valid
  end

  it "is not valid without a completion time" do
    game = Game.new(completion_time: nil)
    expect(game).to_not be_valid
  end

end
