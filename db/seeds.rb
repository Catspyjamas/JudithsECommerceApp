# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.create(user_id: 1, product_id: 1, total: 10.0)
Order.create(user_id: 1, product_id: 2, total: 5.0)


Product.create(name: 'Chanterelle', description: 'Vase-shaped, bright yellow to orange fungus. Nutty and delicate in flavor and texture, they are also available dried and canned.', image_url: 'chanterelle.jpg', toxicity: 'edible', price: '12.99')
Product.create(name: 'Fly Amanita', description: 'Amanita muscaria is the classic European fairytale mushroom, bearing white gills and white warts on a typically bright red cap. It is known to contains several toxic, psychoactive compounds. Perfect present for stepmoms or -dads.', image_url: 'fly_amanita.jpg', toxicity: 'quite toxic', price: '29.31')
Product.create(name: 'Sparassis', description: 'Queen of the forest. A one-mushroom party. Big, easy to identify, delicious. Takes hours to clean. Well worth the effort. What’s not to love?', image_url: 'sparassis.jpg', toxicity: 'edible', price: '15.99')