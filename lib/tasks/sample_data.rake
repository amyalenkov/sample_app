namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "admin",
                         email: "example@railstutorial.org",
                         password: "admin1",
                         password_confirmation: "admin1",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: false)
    end

    users = User.first 5
    50.times do
      content = Faker::Lorem.sentence 5
      users.each do |user|
        user.microposts.create!(content: content)
      end
    end

  end
end