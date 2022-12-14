require "open-uri"

puts "Deleting Restaurant Photos..."
Restaurant.all.each do |restaurant|
  restaurant.photo.destroy
  puts "#{restaurant.name} photos deleted!"
end

puts "Deleting Dishes Photos..."
Dish.all.each do |dish|
  dish.photos.each do |photo|
    photo.destroy
  end
  puts "#{dish.name} photos deleted!"
end

puts "Destroying Restaurants..."
Restaurant.destroy_all
puts "Destroying Users..."
User.destroy_all

puts "\n"
puts "--------------------"
puts "\n"

puts "Creating Restaurants..."
puts "creating new restaurant"
r = Restaurant.new(name: "Vegan Junkies", owner: "Eva Haverkort", location: "Near campus")
puts "opening a file"
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630511/FoodVisualizer/Original/va2pzag9efs8lrfso067rev540tm.png")
puts "attaching picture"
r.photo.attach(io: file, filename: "veganjunkies.png", content_type: "image/png")
puts "saving the picture"
r.save
puts "Created #{r.name}!"

u = User.create!(email: "ealhaverkort@gmail.com", password: "1234567890", first_name: "Eva", last_name: "Haverkort")
puts "Created #{u.first_name}!"

UserRestaurant.create!(user_id: u.id, restaurant: r) # or (user: u, restaurant: r)

m = Menu.create!(name: "Lunch menu", category: "lunch", restaurant_id: r.id, description: '
  Lunch menu with many diverse dishes to choose from, available from noon until 16:00')
puts "Created #{m.name}!"

fries = Dish.new(dish_type: :side, average_rating: 3, name: "Fries", menu_id: m.id, description: "Homemade french fries", price: 7)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630572/FoodVisualizer/Original/f0rm9f846ma1f9nmqesnn983ue6d.jpg")
fries.photos.attach(io: file, filename: "fries.jpg", content_type: "image/jpg")
fries.save
puts "Created #{fries.name}!"

cesarsalad = Dish.new(dish_type: :side, average_rating: 4, name: "Cesar Salad", menu_id: m.id, description: "Chopped romaine lettuce with garlicky croutons and a creamy sauce", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630579/FoodVisualizer/Original/q9y21lhvag0z0gma4txl1t21fu0i.jpg")
cesarsalad.photos.attach(io: file, filename: "cesarsalad.jpg", content_type: "image/jpg")
cesarsalad.save
puts "Created #{cesarsalad.name}!"

onionsoup = Dish.new(dish_type: :starter, average_rating: 3, name: "Onion Soup", menu_id: m.id, description: "Soup with onions and butter", price: 13)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630536/FoodVisualizer/Original/p7ylaud6g3b15ht6qmyllbv91f3k.jpg")
onionsoup.photos.attach(io: file, filename: "onionsoup.jpg", content_type: "image/jpg")
onionsoup.save
puts "Created #{onionsoup.name}!"

guacamole = Dish.new(dish_type: :side, average_rating: 5, name: "Guacamole", menu_id: m.id, description: "Creamy, avocado-based dip", price: 7)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630553/FoodVisualizer/Original/5hqdovoi84xemsxzcpg6cncoj9og.jpg")
guacamole.photos.attach(io: file, filename: "guacamole.jpg", content_type: "image/jpg")
guacamole.save
puts "Created #{guacamole.name}!"

burrito = Dish.new(dish_type: :main, average_rating: 5, name: "Burrito", menu_id: m.id, description: "Tortilla with meat and tomatoes", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630514/FoodVisualizer/Original/2kd30788nbm1o7egj3mj8pzr5qcj.jpg")
burrito.photos.attach(io: file, filename: "burrito.jpg", content_type: "image/jpg")
burrito.save
puts "Created #{burrito.name}!"
Review.create!(content: "Best burrito in town", rating: 5, dish_id: burrito.id)
Review.create!(content: "Very good, but a little dry", rating: 4, dish_id: burrito.id)

quesadilla = Dish.new(dish_type: :main, average_rating: 4, name: "Quesadilla", menu_id: m.id, description: "Tortilla filled with cheese", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630561/FoodVisualizer/Original/rjmynz85vrki1r3gg51x2zrwax9r.jpg")
quesadilla.photos.attach(io: file, filename: "quesadilla.jpg", content_type: "image/jpg")
quesadilla.save
puts "Created #{quesadilla.name}!"
Review.create!(content: "Very good", rating: 4, dish_id: quesadilla.id)

tacos = Dish.new(dish_type: :starter, average_rating: 1, name: "Tacos", menu_id: m.id, description: "Corn-based tortilla", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630522/FoodVisualizer/Original/ir783sp3kwfeycmzgyzfhvalxu0b.jpg")
tacos.photos.attach(io: file, filename: "tacos.jpg", content_type: "image/jpg")
tacos.save
puts "Created #{tacos.name}!"
Review.create!(content: "Tastes like feet", rating: 0, dish_id: tacos.id)
Review.create!(content: "The tortilla was not corn-based like they said", rating: 2, dish_id: tacos.id, created_at: 3.weeks.ago )

poke = Dish.new(dish_type: :main, average_rating: 3, name: "Poke", menu_id: m.id, description: "Diced raw fish", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630570/FoodVisualizer/Original/gt6hf49bca6s3z3r1hiyp9vnph64.jpg")
poke.photos.attach(io: file, filename: "poke.jpg", content_type: "image/jpg")
poke.save
puts "Created #{poke.name}!"

pepperonipizza = Dish.new(dish_type: :main, average_rating: 5, name: "Pepperoni Pizza", menu_id: m.id, description: "Mozzarela, tomato sauce and pepperoni", price: 12)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630581/FoodVisualizer/Original/7l47ktezp622s69y3yr88gat0yu8.jpg")
pepperonipizza.photos.attach(io: file, filename: "pepperonipizza.jpg", content_type: "image/jpg")
pepperonipizza.save
puts "Created #{pepperonipizza.name}!"
Review.create!(content: "Perfect! Best tomato sauce ever.", rating: 5, dish_id: pepperonipizza.id, created_at: 2.weeks.ago)

mozzarellapizza = Dish.new(dish_type: :main, average_rating: 5, name: "Mozzarella Pizza", menu_id: m.id, description: "Mozzarela, basil and tomato sauce", price: 10)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630584/FoodVisualizer/Original/8hz2j3c3svrr7sadd93qxqkhaiwu.jpg")
mozzarellapizza.photos.attach(io: file, filename: "mozzarellapizza.jpg", content_type: "image/jpg")
mozzarellapizza.save
puts "Created #{mozzarellapizza.name}!"
Review.create!(content: "Love it", rating: 5, dish_id: mozzarellapizza.id, created_at: 15.days.ago)

pizza = Dish.new(dish_type: :main, average_rating: 2, name: "Pizza", menu_id: m.id, description: "Pizza with tomato sauce and other stuff", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662462457/FoodVisualizer/Original/pizza_c64vj7.jpg")
pizza.photos.attach(io: file, filename: "pizza.jpg", content_type: "image/jpg")
pizza.save
puts "Created #{pizza.name}!"
Review.create!(content: "The tomato sauce tastes like ketchup", rating: 2, dish_id: pizza.id, created_at: 5.weeks.ago)

churros = Dish.new(dish_type: :dessert, average_rating: 5, name: "Churros", menu_id: m.id, description: "Delicious vegan homemade churros", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630566/FoodVisualizer/Original/xvl3o9lryr5n1fsz0lxwfnbou6ej.jpg")
churros.photos.attach(io: file, filename: "churros.jpg", content_type: "image/jpg")
churros.save
puts "Created #{churros.name}!"
Review.create!(content: "Perfect churros!", rating: 5, dish_id: churros.id, created_at: 20.days.ago)
Review.create!(content: "Loved it!", rating: 5, dish_id: churros.id, created_at: 7.weeks.ago)

brownie = Dish.new(dish_type: :dessert, average_rating: 5, name: "Brownie", menu_id: m.id, description: "Chocolate brownie, very nice", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662556789/FoodVisualizer/Original/eah2pveigt21o2v2p0tiiuzctnmk.jpg")
brownie.photos.attach(io: file, filename: "brownie.jpg", content_type: "image/jpg")
file1 = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630534/FoodVisualizer/Original/bexxbkp3om5f5e4yp3w86vlh1qhu.jpg")
brownie.photos.attach(io: file1, filename: "brownie.jpg", content_type: "image/jpg")
brownie.save
puts "Created #{brownie.name}!"
Review.create!(content: "Perfect! Better than my husband's", rating: 5, dish_id: brownie.id, created_at: 9.weeks.ago)

cheesecake = Dish.new(dish_type: :dessert, average_rating: 3, name: "Cheesecake", menu_id: m.id, description: "Unique type of cake", price: 5)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630541/FoodVisualizer/Original/v5u5a1c7nfc3s91z1dcsfb9t4s0a.jpg")
cheesecake.photos.attach(io: file, filename: "cheesecake.jpg", content_type: "image/jpg")
cheesecake.save
puts "Created #{cheesecake.name}!"

hazelnutbrownie = Dish.new(dish_type: :dessert, average_rating: 3, name: "Homemade Brownie", menu_id: m.id, description: "Chocolat brownie with hazelnut", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630575/FoodVisualizer/Original/yswgr0gqtc4pcds17codu8fu9wmo.jpg")
hazelnutbrownie.photos.attach(io: file, filename: "hazelnutbrownie.jpg", content_type: "image/jpg")
hazelnutbrownie.save
puts "Created #{hazelnutbrownie.name}!"

icecream = Dish.new(dish_type: :dessert, average_rating: 3, name: "Passion Fruit Ice Cream", menu_id: m.id, description: "Homemade passion fruit ice cream", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630558/FoodVisualizer/Original/7377xs4hfbvpoqf2uhskp7inddtd.jpg")
icecream.photos.attach(io: file, filename: "icecream.jpg", content_type: "image/jpg")
icecream.save
puts "Created #{icecream.name}!"

jarritos = Dish.new(dish_type: :drink, average_rating: 5, name: "Jarritos", menu_id: m.id, description: "Mexican Soda", price: 4)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630563/FoodVisualizer/Original/hyiiu4c0veo84zs9jbtycs7svlt5.jpg")
jarritos.photos.attach(io: file, filename: "jarritos.jpg", content_type: "image/jpg")
jarritos.save
puts "Created #{jarritos.name}!"
Review.create!(content: "The BEST soda!", rating: 5, dish_id: jarritos.id, created_at: 23.days.ago)

aperol = Dish.new(dish_type: :drink, average_rating: 2, name: "Aperol Spritz", menu_id: m.id, description: "Prosecco Cocktail with orange slice", price: 23)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630586/FoodVisualizer/Original/ltl3v2lr1k2o1hzx5ryfv7k5lr7k.jpg")
aperol.photos.attach(io: file, filename: "aperol.jpg", content_type: "image/jpg")
aperol.save
puts "Created #{aperol.name}!"
Review.create!(content: "Good (not great) and very expensive", rating: 2, dish_id: aperol.id, created_at: 5.weeks.ago)

sangria = Dish.new(dish_type: :drink, average_rating: 3, name: "Sangria", menu_id: m.id, description: "White rum cocktail", price: 8)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630556/FoodVisualizer/Original/d2c14jpt95la1v8b7u2qoy9nwbhz.jpg")
sangria.photos.attach(io: file, filename: "sangria.jpg", content_type: "image/jpg")
sangria.save
puts "Created #{sangria.name}!"

dm = Menu.create!(name: "Winter menu", category: "dinner", restaurant_id: r.id, description: '
  Menu with lots of local winter vegetables and popular flavours.')

pizza = Dish.new(dish_type: :main, average_rating: 4, name: "Pizza", menu_id: dm.id, description: "Pizza with tomato sauce and other stuff", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630584/FoodVisualizer/Original/8hz2j3c3svrr7sadd93qxqkhaiwu.jpg")
pizza.photos.attach(io: file, filename: "mozzarellapizza.jpg", content_type: "image/jpg")
pizza.save
puts "Created #{pizza.name}!"


churros = Dish.new(dish_type: :dessert, average_rating: 3, name: "Churros", menu_id: dm.id, description: "Delicious vegan homemade churros", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630566/FoodVisualizer/Original/xvl3o9lryr5n1fsz0lxwfnbou6ej.jpg")
churros.photos.attach(io: file, filename: "churros.jpg", content_type: "image/jpg")
churros.save
puts "Created #{churros.name}!"

sm = Menu.create!(name: "Summer menu", category: "lunch", restaurant_id: r.id, description: '
  Healthy options for you to have fresh bread wherever and whenever you want, with that bakery aroma and incredible flavor.')
puts "Created #{sm.name}!"

quesadilla = Dish.new(dish_type: :main, average_rating: 3, name: "Quesadilla", menu_id: sm.id, description: "Tortilla filled with cheese", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630561/FoodVisualizer/Original/rjmynz85vrki1r3gg51x2zrwax9r.jpg")
quesadilla.photos.attach(io: file, filename: "quesadilla.jpg", content_type: "image/jpg")
quesadilla.save
puts "Created #{quesadilla.name}!"

jarritos = Dish.new(dish_type: :drink, average_rating: 3, name: "Jarritos", menu_id: sm.id, description: "Mexican Soda", price: 3)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630563/FoodVisualizer/Original/hyiiu4c0veo84zs9jbtycs7svlt5.jpg")
jarritos.photos.attach(io: file, filename: "jarritos.jpg", content_type: "image/jpg")
jarritos.save
puts "Created #{jarritos.name}!"

churros = Dish.new(dish_type: :dessert, average_rating: 3, name: "Churros", menu_id: sm.id, description: "Delicious vegan homemade churros", price: 11)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630566/FoodVisualizer/Original/xvl3o9lryr5n1fsz0lxwfnbou6ej.jpg")
churros.photos.attach(io: file, filename: "churros.jpg", content_type: "image/jpg")
churros.save
puts "Created #{churros.name}!"

# a = Restaurant.create!(name: "Local Kitchen", owner: "Jesus", location: "Baixa Chiado")
# puts "Created #{a.name}!"
# b = User.create!(email: "localkitchen@gmail.com", password: "6897456891")
# puts "Created #{b.email}!"
# UserRestaurant.create!(user_id: b.id, restaurant_id: a.id) # or (user: u, restaurant: r)
# lkm = Menu.create!(name: "Lunch menu", category: "lunch", restaurant_id: a.id, description: 'At breakfast or lunch, at school or work, whether sweet or savory, there is only one option here: to be tasty and healthy.')
# puts "Created #{lkm.name}!"

z = Restaurant.new(name: "Faustino", owner: "Eva Haverkort", location: "Lisbon")
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662627354/FoodVisualizer/Original/jhm0wo3s4ynhsd5tvbay1qvu9wi4.png")
z.photo.attach(io: file, filename: "bonton.png", content_type: "image/png")
z.save
puts "Created #{z.name}!"

UserRestaurant.create!(user_id: u.id, restaurant_id: z.id) # or (user: u, restaurant: r)

lfm = Menu.create!(name: "Dinner menu", category: "dinner", restaurant_id: z.id, description:'A mixture of colors and flavors that came out of the earth, full of life, and will end up on your plate.')
puts "Created #{lfm.name}!"

cesarsalad = Dish.new(dish_type: :starter, average_rating: 3, name: "Cesar Salad", menu_id: lfm.id, description: "Chopped romaine lettuce with garlicky croutons and a creamy sauce", price: 9)
file = URI.open("https://res.cloudinary.com/dmxsjswbi/image/upload/v1662630579/FoodVisualizer/Original/q9y21lhvag0z0gma4txl1t21fu0i.jpg")
cesarsalad.photos.attach(io: file, filename: "cesarsalad.jpg", content_type: "image/jpg")
cesarsalad.save
puts "Created #{cesarsalad.name}!"
Review.create!(content: "Good for a salad!", rating: 3, dish_id: cesarsalad.id, created_at: 2.weeks.ago)
