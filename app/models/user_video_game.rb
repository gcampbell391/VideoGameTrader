class UserVideoGame < ApplicationRecord
    belongs_to :user
    belongs_to :game




    def yes_or_no
        if self.tradeable == false 
            return "Not at the moment"
        elsif self.tradeable == true 
            return "Yes, Let's Trade!"
        end
    end
end
