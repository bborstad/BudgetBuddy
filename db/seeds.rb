# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
u1 = User.create!(
  email: 'alice@gmail.com',
  password: 'password'
)

u2 = User.create!(
  email: 'bob@gmail.com',
  password: 'password'
)

# Goals
g1 = Goal.create!(
  user: u1,
  title: 'New Car',
  progress: 10000,
  goal: 18000
)

g2 = Goal.create!(
  user: u1,
  title: 'Computer',
  progress: 300,
  goal: 3000
) 

g3 = Goal.create!(
  user: u1,
  title: '6 Month Savings',
  progress: 12000,
  goal: 12000
)

g4 = Goal.create!(
  user: u2,
  title: 'Student Loans',
  progress: 5000,
  goal: 22000
)

g5 = Goal.create!(
  user: u2,
  title: 'Savings',
  progress: 2000,
  goal: 10000
)

# Budgets & Categories
b1 = Budget.create!(
  user: u1,
  month: "October"
)

c1 = Category.create!(
  budget: b1,
  name: "Income",
  projected: 2340.00,
  actual: 800.00,
  grouping: "income"
)

c2 = Category.create!(
  budget: b1,
  name: "Gas",
  projected: 150.00,
  actual: 82.27,
  grouping: "transportation"
)

c3 = Category.create!(
  budget: b1,
  name: "Maintenance",
  projected: 20.00,
  actual: 0.00,
  grouping: "transportation"
)

c4 = Category.create!(
  budget: b1,
  name: "Eating Out",
  projected: 25.00,
  actual: 17.06,
  grouping: "food and groceries"
)