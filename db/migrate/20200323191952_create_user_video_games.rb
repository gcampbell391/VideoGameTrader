class CreateUserVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_video_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :tradeable, default: false

      t.timestamps
    end
  end
end
