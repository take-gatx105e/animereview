# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  name: Rails.application.credentials.user[:name],
  email: Rails.application.credentials.user[:email],
  password: Rails.application.credentials.user[:password]
)

User.create(
  name: Rails.application.credentials.user[:name1],
  email: Rails.application.credentials.user[:email1],
  password: Rails.application.credentials.user[:password1]
)

Entry.create(user_id: 1, title: 'SHIROBAKO', introduction: 'SHIROBAKOのレビューです！')
