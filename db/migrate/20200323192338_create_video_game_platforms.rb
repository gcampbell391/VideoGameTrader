class CreateVideoGamePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :video_game_platforms do |t|
      t.integer :game_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
