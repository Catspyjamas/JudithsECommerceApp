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

Comment.create(user: User.first, product: Product.first, rating: 1, body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.")
Comment.create(user: User.last, product: Product.last, rating: 4, body: "Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus.")
Comment.create(user: User.first, product: Product.first, rating: 6, body: "Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.")
