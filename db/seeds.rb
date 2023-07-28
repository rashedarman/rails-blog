# Create users
user1 = User.create(
  name: 'Terry Medhurst',
  photo: 'https://robohash.org/hicveldicta.png', 
  bio: 'Lorem ipsum dolor sit amet.', 
  posts_counter: 0,
)
user2 = User.create(
  name: 'Sheldon Quigley', 
  photo: 'https://robohash.org/doloremquesintcorrupti.png',
  bio: 'Consectetur adipiscing elit.',
  posts_counter: 0,
)
user3 = User.create(
  name: 'Terrill Hills',
  photo: 'https://robohash.org/consequunturautconsequatur.png',
  bio: 'Sed do eiusmod tempor incididunt.',
  posts_counter: 0,
)

# Create posts
post1 = Post.create(
  author: user1,
  title: 'Amazing Journey',
  text: 'First step into the unknown', 
  comments_counter: 0, 
  likes_counter: 0,
)
post2 = Post.create(
  author: user1,
  title: 'Exploring the Wilderness',
  text: 'Venturing deeper into the wilderness', 
  comments_counter: 0, 
  likes_counter: 0,
)
post3 = Post.create(
  author: user2,
  title: 'Unraveling the Enigma',
  text: 'Unlocking the secrets of the universe', 
  comments_counter: 0, 
  likes_counter: 0,
)
post4 = Post.create(
  author: user3,
  title: 'A Tale of Valor',
  text: 'Overcoming challenges and triumphing', 
  comments_counter: 0, 
  likes_counter: 0,
)

# Create comments
Comment.create(post: post1, author: user2, text: 'First comment')
Comment.create(post: post1, author: user2, text: 'Second comment')
Comment.create(post: post2, author: user2, text: 'Third comment')
Comment.create(post: post3, author: user2, text: 'Fourth comment')
Comment.create(post: post4, author: user2, text: 'Fifth comment')
