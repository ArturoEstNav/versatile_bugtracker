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

puts 'Creating sample user'
user = User.new(
        email: "arturoestradanav@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        first_name: "Arturo",
        last_name: "Estrada Navarrete",
        employee_number: (rand * 1000000).round,
        admin: true
        )
user.save

puts 'Creating sample project'
project = Project.new(
          name: "Versatile bugtracker",
          description: "Create a bugtracker that enhances productivity"
          )
project.save

puts 'Creating sample ticket'
ticket = Ticket.new(
          title: "Descriptive title",
          description: "Specifics of the tastk",
          priority: "necessary" ,
          project_id: Project.last.id,
          category: "back end",
          )
ticket.save
