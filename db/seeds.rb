# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
def create_user username, password
  u = User.new username: username
  u.password = password
  u.password_confirmation = password
  u.save
end

create_user 'alice', 'password1'
create_user 'bob', 'password2'
create_user 'charlie', 'password3'
