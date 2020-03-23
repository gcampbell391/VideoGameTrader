class VideoGamePlatform < ApplicationRecord
    belongs_to :game
    belongs_to :platform
end
