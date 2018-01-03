# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{name: "Alice", email: "secret+alice@jbarel.com", password: "123456", password_confirmation: "123456"},
	{name: "Bob", email: "secret+bob@jbarel.com", password: "123456", password_confirmation: "123456"}])

offset = User.last.id

200.times do |n|
	name = Faker::Name.name
	email = "secret+#{n+offset}@jbarel.com"
	password = "123456"
	User.create! ({
			name: 					name,
			email: 					email,
			password: 				password,
			password_confirmation: 	password
		})
end

arr = [User.first, User.second, User.third]
ex_arr = []

arr.each do |user|
	2.times do |n|
		ex = Exchange.new(owner: user, name: "#{user.name}'s test Exchange ##{n}")
		if (ex.save)
			ex_arr.push(ex)
		end
	end
end

User.offset(User.count-150).each do |user|
	user.join(ex_arr[user.id%(ex_arr.size)])
end

