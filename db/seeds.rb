# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user1 = User.find_or_create_by!(email: 'martin@vsplus.com') do |user|
        user.password = "password"
        user.password_confirmation = "password"
end
puts 'CREATED DUMMY USER ' << user1.email

#ad1 = Ad.new()   
#ad1.title = "harry poter et les 7 nains"
#ad1.description = "bleu"
#ad1.price = 5
#ad1.user = user1
#ad1.book = book1 = Book.new()
#
#book1.ad = ad1
#book1.ISBN = 67872364
#
#ad1.save
#book1.save
#
#puts 'CREATED BOOK1 ' << ad1.title
#
#ad2 = Ad.new()   
#ad2.title = "laptop mince"
#ad2.description = "pas cher"
#ad2.price = 500
#ad2.user = user1
#ad2.electronic = electronic1 = Electronic.new()
#
#electronic1.ad = ad2
#electronic1.brand = "Samsung"
#electronic1.model = "Ativ 9 " 
#
#ad2.save
#electronic1.save
#
#puts 'CREATED ELECTRONIC1 ' << ad2.title
#
#ad3 = Ad.new(title: "laptop", description: "laptop pas cher", price: 400)   
#ad3.user = user1
#ad3.electronic = electronic3 = Electronic.new(brand: "HP", model: "sleekbook", ad: ad3 )
#
#ad3.save
#electronic3.save
#
#puts 'CREATED ELECTRONIC1 ' << ad3.title
#
#ad4 = Ad.new(title: "laptop", description: "laptop pas cher", price: 350)   
#ad4.user = user1
#ad4.electronic = electronic4 = Electronic.new(brand: "lenovoo", model: "X1 carbon", ad: ad3 )
#
#ad4.save
#electronic4.save
#puts 'CREATED ELECTRONIC1 ' << ad4.title
