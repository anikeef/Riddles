avatar = File.open("test/fixtures/files/avatar.jpg")

User.create!(name: "Example",
  email: "foo@bar.com",
  password: "foobar",
  password_confirmation: "foobar",
  avatar: avatar)

5.times do |n|
  user = User.create!(name: "Example#{n}",
    email: "foo#{n}@bar.com",
    password: "foobar",
    password_confirmation: "foobar",
    avatar: avatar)
  user.problems.create!(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat?",
    answer: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore")
end
