# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#creates 10 users and gives them a random number of tools between 0 and 5
10.times do
  user = User.create(name: Faker::Name.name,
    password: "password",
    email: Faker::Internet.email,
    location: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code)
  rand(0..5).times do
    tool = Tool.create(name: Faker::Commerce.product_name,
      safety_level: 'safe',
      condition: 'new',
      lender_id: user.id)
        1.times do
          listing = Listing.create(notes: (Faker::Lorem.sentences(1).join(" ")),
          name: tool.name,
          tool_id: tool.id)
        end
    end
end

#creates between 10 and 30 reviews with lorem content and a random rating
rand(10..30).times do
  content = Faker::Lorem.paragraph(2)
  rating = rand(0..5)
  tool = Tool.find(rand(1..Tool.all.count))
  review = Review.create(rating: rating, content: content, tool_id: tool.id)


end
