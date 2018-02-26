# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'lewagon@uni.com', first_name: 'Test', last_name: 'Test', password: 'password')
Voucher.create!(name: 'Amazon Gift Card', category: 'Books', price: 20, end_date: Date.tomorrow(), quantity_left: 5, user_id: 1)

Voucher.create!(name: 'VUE Voucher', category: 'Movies', price: 10, end_date: Date.tomorrow(), quantity_left: 2, user_id: 1)
