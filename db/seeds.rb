User.create!(full_name: 'aboba',
             email: 'aboba@mail.ru',
             password: '123')

10.times do |u|
  full_name = Faker::Name.name
  email = "example-#{u+1}@tasktracker.org"
  password = "password"

  User.create!(full_name: full_name,
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
end

Project.count.times do |p|
  3.times do |n|
    title = Faker::Games::Minecraft.item + '12345'
    description = "#{title} descripton!!!"
    project = Project.find(p + 1)
    deadline_at = Time.now.to_s(:long)

    Task.create!(title: title,
                 description: description,
                 deadline_at: deadline_at,
                 project: project)
  end
end

Task.count.times do |t|
  5.times do |n|
    content = Faker::Hacker.say_something_smart
    user = User.find(rand(1..10))
    task = Task.find(t + 1)

    Comment.create!(user: user,
                    task: task,
                    content: content)
  end
end
