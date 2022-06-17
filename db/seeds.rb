require 'faker'

def create_user(first_name, full_name, path, image)
  user = User.new(
    email: "#{first_name}@gmail.com",
    password: '123456',
    name: full_name
  )
  # user.avatar.attach(io: File.open('app/assets/images/default-avatar-icon.png'),
  #                    filename: 'default-avatar-icon.png',
  #                    content_type: 'image/png')
  user.avatar.attach(io: File.open(path),
                     filename: image)
  user.save!
  return user
end

def create_project(user, name, description)
  project = Project.new(
    user: user,
    name: name,
    description: description,
    price: (100..900).to_a.sample,
    status: 'In progress',
    due_date: Faker::Date.forward
  )
  project.save!
  return project
end

def create_task(name, project, description)
  task = Task.new(
    # name: Faker::Hobby.activity,
    # project: Project.all.sample,
    # description: Faker::Lorem.sentence(word_count: 3),
    name: name,
    project: project,
    description: description,
    estimated_effort: (1..40).to_a.sample,
    due_date: Faker::Date.forward
  )
  task.save!
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
puts 'Creating users'
puts "************************"

agathe = create_user('agathe', 'Agathe Lurquin', 'app/assets/images/Agathe.jpg', 'Agathe.jpg')
adriana = create_user('adriana', 'Adriana Osorio', 'app/assets/images/adriana.jpg', 'adriana.jpg')
julia = create_user('julia', 'Julia 54rtor1', 'app/assets/images/juliaS.jpg', 'juliaS.jpg')
lucas = create_user('lucas', 'Lucas Mendes', 'app/assets/images/Lucas.jpg', 'Lucas.jpg')

create_user('ethan', 'Ethan Hunt', 'app/assets/images/TomCruise.jpg', 'TomCruise.jpg')
create_user('alexandre', 'Alexandre Vieira', 'app/assets/images/Alex.jpg', 'Alex.jpg')
create_user('alfredo', 'Alfredo', 'app/assets/images/alfredo.jpg', 'alfredo.jpg')
create_user('arthur', 'Arthur', 'app/assets/images/Arthur.jpg', 'Arthur.jpg')
create_user('fabiano', 'Fabiano Catao', 'app/assets/images/fabiano.jpg', 'fabiano.jpg')
create_user('guilhermeJ', 'Guilherme Jafrone', 'app/assets/images/GuiJafrone.png', 'GuiJafrone.png')
create_user('guilhermeP', 'Guilherme Petkovic', 'app/assets/images/guilhermeP.jpg', 'guilhermeP.jpg')
create_user('haniff', 'Haniff Amouei', 'app/assets/images/hanif.jpg', 'hanif.jpg')
create_user('leo', 'Leonardo Conti', 'app/assets/images/leo.png', 'leo.png')
create_user('nicholas', 'Nickolas Farias', 'app/assets/images/nicholas.jpg', 'nicholas.jpg')
create_user('pedroA', 'Pedro Aguiar', 'app/assets/images/pedro.jpg', 'pedro.jpg')
create_user('pedroB', 'Pedro Bueno', 'app/assets/images/pedroBueno.jpg', 'pedroBueno.jpg')
create_user('paulo', 'Paulo Valladares', 'app/assets/images/paulo.jpg', 'paulo.jpg')


puts "**************************************"
puts 'Creating projects and tasks '
puts "**************************************"

project_agathe_one = create_project(agathe, "Landing Page", "Design and implement the landing page for the company")
project_agathe_two = create_project(agathe, "Product rebranding", "Implement new branding strategy for products")
project_agathe_three = create_project(agathe, "Service rebranding", "Implement new branding strategy for services")
project_agathe_four = create_project(agathe, "Customer Satisfaction", "Implement survey to measure customer satisfaction")

create_task("Brainstorming", project_agathe_one, "Brainstorm ideas during team session")
create_task("Design on Figma", project_agathe_one, "Register on Figma the ideas brainstormed in team session")
create_task("Approval", project_agathe_one, "Obtain approval from design leadership")
create_task("Handover design to UX team", project_agathe_one, "Set up a meeting to hand the Figma design to the UX team")

create_task("Contract marketing consultant", project_agathe_two, "Run request for quotation and hire a new marketing agency")
create_task("Status meetings", project_agathe_two, "Run weekly status meetings with marketing agency")
create_task("Rebranding implementation", project_agathe_two, "Implement the new branding strategy")

create_task("Contract marketing consultant", project_agathe_three, "Run request for quotation and hire a new marketing agency")
create_task("Status meetings", project_agathe_three, "Run weekly status meetings with marketing agency")
create_task("Rebranding implementation", project_agathe_three, "Implement the new branding strategy")

create_task("Contract survey agency", project_agathe_four, "Run request for quotation and hire a survey agency")
create_task("Design survey", project_agathe_four, "Brainstrom ideas for designing the customer satisfaction survey")
create_task("Run survey", project_agathe_four, "Run the survey in collaboration with survey agency")
create_task("Analyse results", project_agathe_four, "Analyse the results of the survey")

project_adriana_one = create_project(adriana, "Le Wagon Rio video campaign", "Marketing campaign be shared on social media for Le Wagon Brazil")
project_adriana_two = create_project(adriana, "Project Demo day Tests", "Run all the actions on the checklist before demo time")

create_task("Check if the app is running", project_adriana_one, " Trigger an HTTP request to the root of your app")
create_task("Redirect naked domain to www", project_adriana_one, "rigger an HTTP request to the root of your app and listen to the response status")
create_task("Set title tag", project_adriana_one, "Scrape the <title> tag on the apps root")
create_task("Set favicon", project_adriana_one, "Resize your logo image in 32x32")
create_task("Set Open Graph meta tags", project_adriana_one, "If one of them is missing, test will fail!")
create_task("Customize 404 and 500", project_adriana_one, "Scrape the text on your /404.html and /500.html pages")
create_task("Set og:image to the right dimension", project_adriana_one, "If the image has the following dimensions: 1200x630, test will pass")

create_task("Edit video", project_adriana_two, "Use this as a reference: <link to video>, maximum 30 seconds long")
create_task("Subtitles in portuguese", project_adriana_two, "Find a brazilian translator and send translated version to video editing")
create_task("Buy music copyright", project_adriana_two, "Contact record label")
create_task("Copywrite for social media", project_adriana_two, "In Portuguese")

10.times do
  create_assignment(User.all.sample)
end

puts "Seeding completed (❁´◡`❁)"
