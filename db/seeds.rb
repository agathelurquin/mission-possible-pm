require 'faker'


def create_user(first_name, full_name)
  user = User.new(
    email: "#{first_name}@gmail.com",
    password: '123456',
    name: full_name
  )
  user.save!
  return user
end

def create_project(user)
  project = Project.new(
    user: user,
    name: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    status: 'In progress',
    due_date: Faker::Date.forward
  )
  project.save!
end

def create_assignment(user)
  assignment = Assignment.new(
    user: user,
    task: Task.all.sample
  )
  assignment.save!
end

puts "*****************"
puts "Cleaning the database"
puts "*****************"

Assignment.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all

puts "************************"
puts 'Creating our own e-mails'
puts "************************"

agathe = create_user 'agathe', 'Agathe Lurquin'
adriana = create_user 'adriana', 'Adriana Osorio'
julia = create_user 'julia', 'Julia 54rtor1'
lucas = create_user 'lucas', 'Lucas Mendes'
joao = create_user 'joao', 'Joao da Silva'


puts "*******************************"
puts 'Creating 10 projects for Agathe'
puts "*******************************"

10.times do
  create_project(agathe)
end

puts "*******************************"
puts 'Creating 10 projects for Adriana'
puts "*******************************"

10.times do
  create_project(adriana)
end

puts "*******************************"
puts 'Creating 10 projects for Julia'
puts "*******************************"

10.times do
  create_project(julia)
end

puts "*******************************"
puts 'Creating 10 projects for Lucas'
puts "*******************************"

10.times do
  create_project(lucas)
end

puts 'Creating 50 fake tasks'

50.times do
  task = Task.new(
    name: Faker::Verb.base,
    project: Project.all.sample,
    description: Faker::Lorem.sentence(word_count: 3),
    due_date: Faker::Date.forward
  )
  task.save!
end

puts "****************************"
puts 'Creating 20 fake users'
puts "****************************"

20.times do
  create_user Faker::Name.first_name, Faker::Name.name
end

puts "*********************************"
puts 'Creating assignments to user Joao'
puts "*********************************"

10.times do
  create_assignment(joao)
end

puts "****************************"
puts 'Creating 50 fake assignments'
puts "****************************"

50.times do
  create_assignment(User.all.sample)
end

puts "Seeding completed (❁´◡`❁)"
