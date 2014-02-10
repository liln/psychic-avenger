# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@editor = User.create(name: "Editor",
                      email: "editor@example.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor")

@author = User.create(name: "Author",
                      email: "author@example.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "author")
