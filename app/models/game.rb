class Game < ApplicationRecord
    has_many :user_video_games
    has_many :users, through: :user_video_games
    has_many :video_game_platforms
    has_many :platforms, through: :video_game_platforms



    def self.highest_rating
        @game = Game.find_by(rating: Game.maximum('rating'))
        return @game.title
    end

    def self.worst_rating
        @game = Game.find_by(rating: Game.minimum('rating'))
        return @game.title
    end

    def self.longest
        @game = Game.find_by(completion_time: Game.maximum('completion_time'))
        return @game.title
    end

    def self.shortest
        @game = Game.find_by(completion_time: Game.minimum('completion_time'))
        return @game.title
    end

    def self.newest
        @game = Game.find_by(release_year: Game.maximum('release_year'))
        return @game.title
    end

    def self.oldest
        @game = Game.find_by(release_year: Game.minimum('release_year'))
        return @game.title
    end
    

    def tradeable_owners 
        newArray = []
        self.user_video_games.each do |uvg|
            if uvg.tradeable == true
                newArray << uvg.user
            end 
        end
        newArray
    end
end 