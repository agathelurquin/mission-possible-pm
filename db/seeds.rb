require 'faker'

puts "Cleaning database"

Project.destroy_all
Task.destroy_all
Assignment.destroy_all

puts 'Database Clean'

puts 'Creating 50 fake users'

50.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Code.npi,
    name: Faker::Name.name
  )
  user.save!
end

puts 'Creating 10 fake projects'

10.times do
  project = Project.new(
    user: User.all.sample,
    name: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    due_date: Faker::Date.forward
  )
  project.save!
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

puts 'Creating 50 fake assignments'

50.times do
  assignment = Assignment.new(
    user: User.all.sample,
    task: Task.all.sample
  )
  assignment.save!
end

puts "finished"
