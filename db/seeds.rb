# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Test user
# create a sandbox user, if sandbox user
puts 'Cleaning database'
User.delete_all

#Seeding page
first_names = ['arturo', 'pepe', 'tony', 'ana']
last_names = ['estrada', 'garcia', 'romero', 'rico']
employee_ids = [123, 124, 125, 126]
emails = ['arturo@bugtracker', 'pepe@bugtracker', 'tony@bugtracker', 'ana@bugtracker']
encrypted_passwords = ['arturo1', 'pepe1', 'tony1', 'ana1']


p "Creating users"
first_names.each_with_index do |employee, index|
  p "Creating user #{index + 1}"
  new_user = User.new
  p "Adding user first_name"
  new_user.first_name = employee
  p "Adding user last_name"
  new_user.last_name = last_names[index]
  p "Adding user employee_id"
  new_user.employee_number = employee_ids[index]
  p "Adding user email"
  new_user.email = emails[index]
  p "Adding user encrypted_password"
  new_user.encrypted_password = encrypted_passwords[index]
  p "Adding user tier"
  new_user.supervisor = false
  if new_user.save
    p "saved"
  end
end

# p "Upgrading user 1 to supervisor"

# User.first.supervisor = true

p "All done"
