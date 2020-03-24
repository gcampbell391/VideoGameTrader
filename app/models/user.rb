class User < ApplicationRecord
    has_secure_password
    has_many :user_video_games
    has_many :games, through: :user_video_games
    has_many :user_platforms
    has_many :platforms, through: :user_platforms


    def video_game_count 
        self.user_video_games.count
    end

    def self.biggest_gamer
        gamer_hash = {}
        User.all.each do |user|
            gamer_hash[user.name] = user.user_video_games.count
        end
        gamer_hash.key(gamer_hash.values.max)
    end

    def wants_to_trade
        if self.user_video_games 
            self.user_video_games.each do |uvg|
                if uvg.tradeable == true
                    return true
                end
            end
        else 
        end
        return false 
    end

    def platform_count 
        self.user_platforms.count
    end



end
