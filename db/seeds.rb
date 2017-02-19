# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'admin', last_name: 'user', phone_number: '777-777-7777', email: 'admin_user@appusers.com', role: 0, password: 'password111')
User.create!(first_name: 'user', last_name: 'user', phone_number: '777-777-7777', email: 'user_user@appusers.com', role: 1, password: 'password111')
User.create!(first_name: 'restricted', last_name: 'user', phone_number: '777-777-7777', email: 'restricted_user@appusers.com', role: 2, password: 'password111')