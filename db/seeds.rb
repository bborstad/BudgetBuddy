# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'open-uri'

def image_fetcher
  open(Faker::Avatar.image)
  rescue
  open("https://robohash.org/sitsequiquia.png?size=300x300&set=set1")
end

# CREATION OF ALICE
u1 = User.create!(email: 'alice@email.com',password: 'password',first_name: 'Alice',last_name: 'Barnett')
u1.avatar.attach({
     io: image_fetcher,
     filename: "#{u1}_faker_image.jpg"
  })
# Accounts
a1 = Account.create!(user: u1, name: 'Bank of America Checking', balance: 780.76)

# Goals
g1 = Goal.create!(user: u1,title: 'New Car',progress: 10000,goal: 18000)
g2 = Goal.create!(user: u1,title: 'Computer',progress: 300,goal: 3000) 
g3 = Goal.create!(user: u1,title: '6 Month Savings',progress: 12000,goal: 12000)

# Budgets, Groups, & Categories
b4 = Budget.create!(user: u1,month: "July",year: 2020)
b3 = Budget.create!(user: u1,month: "August",year: 2020)
b2 = Budget.create!(user: u1,month: "September",year: 2020)
b1 = Budget.create!(user: u1,month: "October",year: 2020)

gr1 = Group.create!(budget: b1,name: "Income")
gr2 = Group.create!(budget: b1,name: "Automobile and Travel")
gr3 = Group.create!(budget: b1,name: "Food and Groceries")

c1 = Category.create!(group: gr1,name: "Paycheck",projected: 2340.00,actual: 800.00)
c2 = Category.create!(group: gr2,name: "Gas",projected: 150.00,actual: 82.27)
c3 = Category.create!(group: gr2,name: "Maintenance",projected: 20.00,actual: 0.00)
c4 = Category.create!(group: gr3,name: "Eating Out",projected: 25.00,actual: 17.06)

# Posts
p1 = Post.create!(user: u1, content: Faker::ChuckNorris.fact)
p2 = Post.create!(user: u1, content: Faker::ChuckNorris.fact)
p3 = Post.create!(user:u1, content: Faker::ChuckNorris.fact)

# Retirements
r1 = Retirement.create!(user: u1, year_of_retirement: 2070, inital_savings: 400.25, intrest_rate: 7.98, annual_savings: 2647.59)
r2 = Retirement.create!(user: u1, year_of_retirement: 2090, inital_savings: 44.25, intrest_rate: 7.98, annual_savings: 245)

# Debts
# Likes
# Follows
puts("created Alice")




#CREATION OF BOB + RANDOM USERS
users = [User.create!(email: 'bob@email.com', password: 'password', first_name: 'Bob', last_name:'Cunningham')]
29.times do
  first = Faker::Name.unique.first_name
  users.push(User.create!(first_name: first, last_name: Faker::Name.last_name, email: Faker::Internet.email(name: first), password: 'password' ))
end

# Generating data for each user.
users.each do |u|
  # ATTENTION: comment out the avatar creation for a faster seed time.
  u.avatar.attach({
     io: image_fetcher,
     filename: "#{u}_faker_image.jpg"
  })
  
  #Goals
  4.times do
    Goal.create!(user: u, title: Faker::Hipster.word, progress: Faker::Number.between(from:0, to:2000), goal: Faker::Number.between(from:2000, to:2500))
  end

  #Budgets > Groups > Categories
  budgets = [Budget.create!(user: u, month: 'July', year: 2020), Budget.create!(user: u, month: 'August', year: 2020), Budget.create!(user: u, month: 'September', year: 2020), Budget.create!(user: u, month: 'October', year: 2020)]
  budgets.each do |b|
    groups = []
    # Build out groups for each budget
    groups.push(Group.create!(budget: b, name: "Income"))
    groups.push(Group.create!(budget: b, name: Faker::Coffee.blend_name))
    groups.push(Group.create!(budget: b, name: Faker::Hipster.word))
    groups.push(Group.create!(budget: b, name: Faker::House.room))
    
    # Build out categories for each group
    groups.each do |g|
      2.times do
        Category.create!(group: g, name: Faker::Hipster.word, projected: Faker::Number.between(from:0, to:199), actual: Faker::Number.between(from:199,to:200))
      end
    end  
  end
  
  # Retirements
  Retirement.create!(user: u, year_of_retirement: 2070, inital_savings: 400.25, intrest_rate: 7.98, annual_savings: 2647.59)
  Retirement.create!(user: u, year_of_retirement: 2090, inital_savings: 4000.25, intrest_rate: 6.98, annual_savings: 6500.00)

  # Accounts
  2.times do
    Account.create!(user: u, name: Faker::Bank.name, balance: Faker::Number.between(from:0, to:250000))
  end

  # Posts
  Post.create!(user: u, content: Faker::ChuckNorris.fact)
  Post.create!(user: u, content: Faker::ChuckNorris.fact)
  Post.create!(user:u, content: Faker::ChuckNorris.fact)
  
  # Debts

  # Likes
  # Follows
  puts("created a new User")
end

puts("Completed seeding the database")