require 'faker'

5.times do 
  user = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

admin = User.new(
  name: 'Shu Haur',
  email: 'shuhaur.tang@gmail.com',
  password: 'wctshwnn',
  role: 'moderator'
  )
admin.skip_confirmation!
admin.save!


20.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lorem.sentence, 
    url: Faker::Internet.url,
    description: Faker::Lorem.paragraph
    )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"