# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger = Logger.new(STDOUT)

Rails.logger.info "Creating users..."

20.times do |i|
  number = i.zero? ? "" : i + 1
  firstname = "User#{number}"
  lastname = "User#{number}"
  email = "#{firstname}@example.com"
  next if User.exists?(email: email)
  User.create!(
    email: email,
    firstname: firstname,
    #confirmed_at: Time.zone.now,
    password: "password"
  )
end