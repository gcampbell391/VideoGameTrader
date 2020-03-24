# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying database..."
Game.destroy_all
Platform.destroy_all
User.destroy_all


puts "Creating Games..."
50.times do 
    Game.create(title: Faker::Game.title, genre: Faker::Game.genre, release_year: Faker::Date.birthday(min_age: 1, max_age: 50), rating: Faker::Number.decimal(l_digits: 1, r_digits: 1), completion_time: Faker::Number.between(from: 4, to: 40))
end

puts "Creating Platforms..."

ps3 = Platform.create(name: "Playstation 3", release_year: 2006)
ps4 = Platform.create(name: "Playstation 4", release_year: 2013)
xbox_360 = Platform.create(name: "XBOX 360", release_year: 2001)
xbox_one = Platform.create(name: "XBOX ONE", release_year: 2013)
PC = Platform.create(name: "PC", release_year: 1975)
switch = Platform.create(name: "Nitendo Switch", release_year: 2017)

puts "Creating Users"

10.times do 
    User.create(name: Faker::Movies::HarryPotter.character, user_name:Faker::Movies::HarryPotter.spell, address: Faker::Movies::HarryPotter.location, email: Faker::Internet.email, password_digest: BCrypt::Password.create('Your_Password'))
end

puts "Creating User Video Games..."

20.times do 
    UserVideoGame.create(user_id: User.all.sample.id, game_id: Game.all.sample.id, tradeable: false  )
end

puts "Creating User Platforms..."

20.times do 
    UserPlatform.create(user_id: User.all.sample.id, platform_id: Platform.all.sample.id )
end

puts "Creating Platform Video Games..."

20.times do 
    VideoGamePlatform.create(game_id: Game.all.sample.id, platform_id: Platform.all.sample.id)
end
puts "We're Durty..."