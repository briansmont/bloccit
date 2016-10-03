require 'random_data'

#create users
5.times do
  User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
    )
end
users = User.all


#create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

#create posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
    )
end

posts = Post.all

#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end
#create admin
admin = User.create!(
  name: "Admin User",
  email: "admin@bloccit.com",
  password: "password",
  role: "admin"
)
member = User.create!(
  name: "Member user",
  email: "member@bloccit.com",
  password: "password",
  role: "member"
)
moderator = User.create!(
  name: "moderator",
  email: "moderator@bloccit.com",
  password: "password",
  role: "moderator"
)
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
