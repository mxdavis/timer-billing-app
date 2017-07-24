require 'faker'

10.times do 
  User.create(
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    company_name: Faker::Company.name,
    bill_rate: Faker::Number.decimal(2)
  )
end

# seed with a billing rate
20.times do 
  Client.create(
    name: Faker::Company.name, 
    email: Faker::Internet.email,
    user_id: rand(1..10)
  )
end


40.times do 
  Project.create(
    name: Faker::Company.bs,
    client_id: rand(1..20),
    bill_rate: Faker::Number.decimal(2)
  )
end

100.times do 
  Task.create(
    project_id: rand(1..30),
    description: Faker::Company.catch_phrase,
    billed: [true, false].sample,
    bill_time: Faker::Number.decimal(2),
    bill_rate: Faker::Number.decimal(2),
    date: Faker::Date.backward(30)
  )
end