class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :release_year
      t.float :rating
      t.integer :completion_time

      t.timestamps
    end
  end
end
