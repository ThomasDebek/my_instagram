# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Delete User and Pics"
User.delete_all
Pic.delete_all

puts "Generating User and Pics"
User.create(email: 'dave@gmail.com', password: 'secret')
User.create(email: 'john@gmail.com', password: 'secret')
User.create(email: 'nikodem@gmail.com', password: 'secret')
User.create(email: 'jurek@gmail.com', password: 'secret')
User.create(email: 'maciek@gmail.com', password: 'secret')

5.times do
  p = Pic.create(
    title: Faker::Commerce.unique.product_name,
    description: Faker::Hipster.sentences.sample,
    user_id: rand(1..5)
  )

    puts "generating - piks - #{p.title}"
    downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{p.title.split.last}")
    p.image.attach(io: downloaded_image, filename: "mi_#{p.id}.png")

end
