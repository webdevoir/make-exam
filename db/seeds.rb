# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = "en-CA"

User.destroy_all

password = "testtest"

User.create! [
	email: "nick@test.com",
	# password_digest: User.new(:password => password).password_digest,
	password: password,
	password_confirmation: password,
	firstname: "Employer",
	lastname:  "Name",
	age: ['12-19', '20+'].sample,
	country: "Canada",
	username: "Employer",
	
]

User.create! [
	email: "test_manager@test.com",
	# password_digest: User.new(:password => password).password_digest,
	password: password,
	password_confirmation: password,
	firstname: "Employer2",
	lastname:  "Name2",
	age: ['12-19', '20+'].sample,
	country: "Brazil",
	username: "Employer2",
	
]

p "Created #{User.count} users"


Examination.destroy_all

10.times do
	Examination.create! [
		name: Faker::Beer.name,
		user_id: Faker::Number.between(User.first.id, User.second.id),
		password: password,
		password_confirmation: password,
		intro: Faker::FamilyGuy.quote,
		conclusion:  Faker::FamilyGuy.quote,
	]
	
end
p "Created #{Examination.count} Exams"
exams = Examination.all
exams.each do |exam|
	quest_count = 1
	10.times do
		Question.new(
		examination_id: exam.id,
		question_type: "Multiple Choice",
		body: Faker::FamilyGuy.quote,
		position: quest_count
	).save(validate: false)
	quest_count +=1
	end

end
p "Created #{Question.count} Questions"
questions = Question.all
questions.each do |ques|
	ans_count = 1
	4.times do
		Answer.create! [
		question_id: ques.id,
		correct: ans_count == 1 ? true : false,
		body: Faker::FamilyGuy.quote,
		order: ans_count
	]
	ans_count +=1
	end

end





p "Created #{Answer.count} Answers"