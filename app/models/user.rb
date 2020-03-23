class User < ApplicationRecord
    has_secure_password
    has_many :user_video_games
    has_many :games, through: :user_video_games
    has_many :user_platforms
    has_many :platforms, through: :user_platforms


    def video_game_count 
        self.user_video_games.count
    end
end
