# Create users
first_user = User.create(
  name: 'Terry Medhurst', photo: 'https://robohash.org/hicveldicta.png', bio: 'Lorem ipsum dolor sit amet.', posts_counter: 0,
)
second_user = User.create(
  name: 'Sheldon Quigley', photo: 'https://robohash.org/doloremquesintcorrupti.png', bio: 'Consectetur adipiscing elit.', posts_counter: 0,
)
third_user = User.create(
  name: 'Terrill Hills', photo: 'https://robohash.org/consequunturautconsequatur.png', bio: 'Sed do eiusmod tempor incididunt.', posts_counter: 0,
)

# Create posts
first_post = Post.create(
  author_id: first_user.id, title: 'Amazing Journey', text: 'First step into the unknown', comments_counter: 0, likes_counter: 0,
)
second_post = Post.create(
  author_id: first_user.id, title: 'Exploring the Wilderness', text: 'Venturing deeper into the wilderness', comments_counter: 0, likes_counter: 0,
)
third_post = Post.create(
  author_id: second_user.id, title: 'Unraveling the Enigma', text: 'Unlocking the secrets of the universe', comments_counter: 0, likes_counter: 0,
)
fourth_post = Post.create(
  author_id: third_user.id, title: 'A Tale of Valor', text: 'Overcoming challenges and triumphing', comments_counter: 0, likes_counter: 0,
)

# Create comments
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'First comment')
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Second comment')
Comment.create(post_id: second_post.id, author_id: second_user.id, text: 'Third comment')
Comment.create(post_id: third_post.id, author_id: second_user.id, text: 'Fourth comment')
Comment.create(post_id: fourth_post.id, author_id: second_user.id, text: 'Fifth comment')
