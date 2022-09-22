# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |u|
  name = Faker::Name.name
  email = "example-#{u+1}@tasktracker.org"
  password = "password"

  User.create!( full_name: name,
                email: email,
                password: password)
end

10.times do |p|
  name = Faker::ProgrammingLanguage.name
  description = "#{name} description!"
  users = User.all

  Project.create!(name: name,
                  description: description,
                  users: users)

  3.times do |t|
    title = Faker::Games::Minecraft.item + '12345'
    description = "#{title} descripton!!!"
    project = Project.find(p + 1)
    deadline_at = Time.now.to_s(:long)

    Task.create!( title: title,
                  description: description,
                  deadline_at: deadline_at,
                  project: project)

    5.times do |c|
      content = Faker::Hacker.say_something_smart
      user = User.find(p + 1)
      task = Task.find(t + 1)

      Comment.create!(user: user,
                      task: task,
                      content: content)
    end
  end
end
