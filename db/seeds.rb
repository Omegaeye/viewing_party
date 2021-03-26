# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Friendship.destroy_all
Movie.destroy_all
User.create!(username: "funbucket13", password: "test", email: 'funbucket13@gmail.com')
@highfive = User.create!(username: "highfive", email: "highfive@fake.com", password: "password", id: 100)
@lowfive = User.create!(username: "lowfive", email: "lowfive@fake.com", password: "password", id: 101)
@sidefive = User.create!(username: "sidefive", email: "sidefive@fake.com", password: "password", id: 102)
@nofive = User.create!(username: "nofive", email: "nofive@fake.com", password: "password", id: 103)
@movie = Movie.create!(title: "The Mummy", duration: 120, api_id: 90)
Friendship.create!(user: @highfive, friend: @lowfive, status: 0)
Friendship.create!(user: @highfive, friend: @sidefive, status: 0)
Friendship.create!(user: @highfive, friend: @nofive, status: 0)
