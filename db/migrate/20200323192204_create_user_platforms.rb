class CreateUserPlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_platforms do |t|
      t.integer :user_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
