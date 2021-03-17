# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Test user
# create a sandbox user, if sandbox user
puts 'Cleaning database'
puts 'Cleaning memo'
Memo.delete_all

puts 'Cleaning tickets'
Ticket.delete_all

puts 'Cleaning user events'
UserEvent.delete_all

puts 'Cleaning event'
Event.delete_all

puts 'Cleaning users'
User.delete_all

puts 'Cleaning projects'
Project.delete_all

user = User.new(
        email: "arturoestradanav@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        first_name: "Arturo",
        last_name: "Estrada Navarrete",
        employee_number: (rand * 1000000).round,
        admin: true
        )
puts 'Sample user created' if user.save

project = Project.new(
          name: "Versatile bugtracker",
          description: "Create a bugtracker that enhances productivity"
          )
puts 'Sample project created' if project.save

ticket = Ticket.new(
          title: "Business Logic",
          description: "Make sure that the basic functions of the application work as intended",
          priority: "necessary" ,
          project_id: Project.last,
          category: "back end",
          user_id: User.last
          )
puts 'Sample ticket created' if ticket.save
