namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    create_users
    create_microposts
    create_relationships
  end

  def create_users
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
  end

  def create_microposts
    users = User.first 5
    50.times do
      content = Faker::Lorem.sentence 5
      users.each do |user|
        user.microposts.create!(content: content)
      end
    end
  end

  def create_relationships
    users = User.first 20
    user = User.second
    followed_users = users[3..10]
    followers = users[5..20]
    followed_users.each { | followed | user.follow! followed }
    followers.each { |follower| follower.follow! user }
  end
end