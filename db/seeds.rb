# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: 'TestingPass'
   )
   user.skip_confirmation!
   user.save!
 end

admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 users = User.all

60.times do
  item = Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample,
    created_at: Faker::Time.between(30.days.ago, Time.now)
    )
  item.save!
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"