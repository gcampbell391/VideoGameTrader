class Platform < ApplicationRecord
    has_many :video_game_platforms
    has_many :games, through: :video_games_platforms
    has_many :user_platforms
    has_many :users, through: :user_platforms
    validates_presence_of :name

    def total_owners
        self.user_platforms.count
    end

    def self.most_popular
        platform_hash = {}
        Platform.all.each do |platform|
            platform_hash[platform.name] = platform.user_platforms.count
        end
        platform_hash.key(platform_hash.values.max)
    end

end
