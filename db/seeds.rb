# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.new(email: "wmaryszczak@gmail.com", password: "test1234", login: "wm", role: 1)
unless admin.save
  puts admin.errors.to_a
end

admin2 = User.new(email: "wmaryszczak@gmail.com", password: "test1234", login: "wm2", role: 1)
unless admin2.save
  puts admin2.errors.to_a
end