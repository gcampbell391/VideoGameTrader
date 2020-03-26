class User < ApplicationRecord
    has_secure_password
    has_many :user_video_games
    has_many :games, through: :user_video_games
    has_many :user_platforms
    has_many :platforms, through: :user_platforms
    validates_presence_of :user_name, :message => '^You must enter a user name!' 
    validates_presence_of :password, :message => '^You must enter a password!' 
    validates_presence_of :email
    validates_presence_of :address


    def self.total_users
        User.all.count
    end

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

    def platforms 
        newArray = []
        self.user_platforms.each do |user_platform|
            newArray << user_platform.platform
        end
        newArray
    end

    def games 
        newArray = []
        self.user_video_games.each do |uvg|
            newArray << uvg.game
        end
        newArray
    end

    def wants_to_trade_count
        count = 0
        if self.user_video_games 
            self.user_video_games.each do |uvg|
                if uvg.tradeable == true
                    count += 1
                end
            end
        end
        count
    end 
    

    def membership_time
        self.created_at.strftime("%Y-%m-%d")
    end


end
