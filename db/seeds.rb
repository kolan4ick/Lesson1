require 'faker'
User.create!(email: 'Kolan4ick@gmail.com', nickname: 'Kolan4ick', password: 'KtT9E4z3muU4L9F',
             password_confirmation: 'KtT9E4z3muU4L9F')

Category.create!(
  [
    { title: 'Category 1' },
    { title: 'Sport' },
    { title: 'Other' }
  ]
)

10.times do
  post = Post.create!(
    title: Faker::Movie.title,
    body: Faker::Movie.quote,
    user_id: 1,
    category_id: 1,
    views: 0
  )
  begin
    file = URI.parse('https://picsum.photos/300').open
    post.image.attach(io: file, filename: post.title.to_s)
  rescue OpenURI::HTTPError => e
    pp e
  end
end
