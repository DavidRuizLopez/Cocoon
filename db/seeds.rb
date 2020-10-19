# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Hotel.destroy_all

category_one = Category.create({price: 50})
category_two = Category.create({price: 40})

hotel1 = Hotel.create({name: 'Barceló Torre de Madrid', normalPrice: 100, discountPrice: 50, description: "One of the best hotel experiences I have had in my life. They treated me wonderfully, the rooms splendid and the food in the restaurant fantastic. The staff could not be more helpful and friendly, special mention to Sonia who made us feel at home, always asking if we were comfortable. I've had an incredible two weeks.", Category: category_one})
hotel2 = Hotel.create({name: 'Iberostar Selection Paseo de Gracia 4 Sup', normalPrice: 90, discountPrice: 40, description: 'Iberostar Selection Paseo de Gracia is located in Barcelona, ​​in Plaza Catalunya, and offers a terrace with a pool and free Wi-Fi throughout. There is private parking.', Category: category_two})
hotel3 = Hotel.create({name: 'Elysées Union', normalPrice: 90, discountPrice: 50, description: 'Elysées Union is housed in a 19th-century building in Paris and features an interior garden and air-conditioned rooms and apartments. It is just a 12-minute walk from the Eiffel Tower.', Category: category_one})

# hotel1.address = "Plaza de España, 18, 28008 Madrid"
# hotel2.address = "Plaça de Catalunya, 10, 08002 Barcelona"
# hotel3.address = "44 Rue de l'Amiral Hamelin, 75116 Paris, Francia"

puts "seed created"
