require 'rails_helper'

RSpec.describe User, type: :system do
  before(:each) do
    @user = User.create(
      name: 'Terry Medhurst',
      photo: 'https://robohash.org/hicveldicta.png',
      bio: 'Lorem ipsum dolor sit amet.',
      posts_counter: 0
    )
    @post = Post.create(
      author: @user,
      title: 'Amazing Journey',
      text: 'First step into the unknown',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe '/index' do
    before(:each) do
      @user2 = User.create(
        name: 'Sheldon Quigley',
        photo: 'https://robohash.org/doloremquesintcorrupti.png',
        bio: 'Consectetur adipiscing elit.',
        posts_counter: 0
      )
      visit users_path
    end

    it 'displays the username for all users' do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
    end

    it 'displays the profile picture for each user' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
      expect(page).to have_css("img[src*='#{@user2.photo}']")
    end

    it 'displays the number of posts each user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts.size}")
    end

    it "redirects to a user's show page when clicking on it" do
      click_link(@user.name)
      expect(page).to have_current_path(user_path(@user))
    end
  end

  describe '/show' do
    before(:each) do
      visit user_path(@user)
    end

    it "displays the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it "displays the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts.size}")
    end

    it "displays the user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "displays the user's 3 most recent posts" do
      post1 = Post.create(author: @user, title: 'First post')
      post2 = Post.create(author: @user, title: 'Second post')
      post3 = Post.create(author: @user, title: 'Third post')
      refresh
      expect(page).to have_content(post1.title)
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post3.title)
      expect(page).not_to have_content(@post.title)
    end

    it "displays a button to view all of the user's posts" do
      expect(page).to have_link('See more', href: user_posts_path(@user))
    end

    it "redirects to a post's show page when clicking on it" do
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(@user, @post))
    end

    it "redirects to the user's post's index page when clicking on 'See all posts'" do
      click_link('See more')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
