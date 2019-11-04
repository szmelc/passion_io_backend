require 'faker'

display_names = [
  'Anowa',
  'Brittnebabe',
  'Barstarzz',
  'Russell Brunson',
  'Tim Nilson',
  'J. K. Rowling',
  'Stephen Hawking',
  'Linkin Park',
  'Lang Lang',
  'Music Performance for Beginners',
  'Learn the Piano',
  'Jimmy Page'
]

puts '---- Generating Users ----'
display_names.each do |name|
  User.create!(
    email: Faker::Internet.email,
    display_name: name,
    password: '123123',
    password_confirmation: '123123'
  )
end

verticals = JSON.parse(File.read(Rails.root.join('db', 'seeds_files', 'verticals.json')))
categories = JSON.parse(File.read(Rails.root.join('db', 'seeds_files', 'categories.json')))
courses = JSON.parse(File.read(Rails.root.join('db', 'seeds_files', 'courses.json')))

puts '---- Generating Verticals ----'
verticals.each do |vertical|
  Vertical.create!(name: vertical['Name'])
end

puts '---- Generating Categories ----'
categories.each do |category|
  Category.create!(name: category['Name'], vertical: Vertical.find(category['Verticals']), state: category['State'])
end

puts '---- Generating Courses ----'
courses.each do |course|
  Course.create!(name: course['Name'], author: User.find_by(display_name: course['Author']), category_id: course['Categories'], state: course['State'])
end

puts '---- Seeds completed ----'
