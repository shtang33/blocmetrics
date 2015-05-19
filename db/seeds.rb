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
users = User.all # to be used for sampling later

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
  password: 'helloworld2',
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
registered_applications = RegisteredApplication.all # to be used for sampling later

50.times do
  name = Faker::Lorem.characters(10)
  registered_app = registered_applications.sample
  Event.create!(
    name: name, 
    registered_application: registered_app
    )
  Event.create!(
    name: name, 
    registered_application: registered_app
    )
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"

