# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Test user
# create a sandbox user, if sandbox user
puts 'Cleaning database'
puts 'Cleaning users'
User.delete_all
puts 'Cleaning projects'
Project.delete_all
puts 'Cleaning tickets'
Ticket.delete_all
puts 'Cleaning memo'
Memo.delete_all
puts 'Cleaning events'
Event.delete_all
