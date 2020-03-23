class Game < ApplicationRecord
    has_many :user_video_games
    has_many :users, through: :user_video_games
    has_many :video_game_platforms
    has_many :platforms, through: :video_game_platforms
end
