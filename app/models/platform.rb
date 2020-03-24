class Platform < ApplicationRecord
    has_many :video_game_platforms
    has_many :games, through: :video_games_platforms
    has_many :user_platforms
    has_many :users, through: :user_platforms


end
