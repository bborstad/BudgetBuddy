# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Users
u1 = User.create!(
  email: 'alice@email.com',
  password: 'password',
  first_name: 'Alice',
  last_name: 'Barnett'
)

u2 = User.create!(
  email: 'bob@email.com',
  password: 'password',
  first_name: 'Bob',
  last_name: 'Cunningham'
)
u3 = User.create!(
  email: 'noe@email.com',
  password: 'password',
  first_name: 'Noe',
  last_name: 'Larson'
)
u4 = User.create!(
  email: 'kennan@email.com',
  password: 'password',
  first_name: 'Kennan',
  last_name: 'Davis'
)
u5 = User.create!(
  email: 'tom@email.com',
  password: 'password',
  first_name: 'Tom',
  last_name: 'Reuben'
)
# Retirements
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

# Budgets, Groups, & Categories for Alice
b4 = Budget.create!(
  user: u1,
  month: "July",
  year: 2020
)

b3 = Budget.create!(
  user: u1,
  month: "August",
  year: 2020
)

b2 = Budget.create!(
  user: u1,
  month: "September",
  year: 2020
)

b1 = Budget.create!(
  user: u1,
  month: "October",
  year: 2020
)


gr1 = Group.create!(
  budget: b1,
  name: "Income"
)

gr2 = Group.create!(
  budget: b1,
  name: "Automobile and Travel"
)

gr3 = Group.create!(
  budget: b1,
  name: "Food and Groceries"
)

c1 = Category.create!(
  group: gr1,
  name: "Paycheck",
  projected: 2340.00,
  actual: 800.00
)

c2 = Category.create!(
  group: gr2,
  name: "Gas",
  projected: 150.00,
  actual: 82.27
)

c3 = Category.create!(
  group: gr2,
  name: "Maintenance",
  projected: 20.00,
  actual: 0.00
)

c4 = Category.create!(
  group: gr3,
  name: "Eating Out",
  projected: 25.00,
  actual: 17.06
)