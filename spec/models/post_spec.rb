require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'masoud@gmail.com', password: '123456', password_confirmation: '123456')

  it 'has a title' do 
    post = Post.new(
      title: '',
      body: 'fake body',
      user: current_user,
      views: 0
    )
    expect(post).not_to be_valid
    post.title = 'has a title'
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do 
    post = Post.new(
      title:'',
      body: 'fake body',
      user: current_user,
      views: 0
    )
    expect(post).not_to be_valid
    post.title = '12'
    expect(post).to be_valid
  end

  it 'has a body' do 
    post = Post.new(
      title: 'fake title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).not_to be_valid
    post.body = 'has a body'
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do 
    post = Post.new(
      title: 'fake title',
      body: 'kjxh',
      user: current_user,
      views: 0
    )
    expect(post).not_to be_valid
    post.body = 'asdfgf'
    expect(post).to be_valid
    hundred_characters = 'askjnckjacnhmkcnhkcnwknwkcnkcncaskjnckjacnhkcnhkcnwkcnwkcnkcncaskjnckjacnhkcnhkcnwkcnwkcnkcnchjyuijh'
    post.body = hundred_characters 
    expect(post).to be_valid
    post.body = hundred_characters + '1'
    expect(post).not_to be_valid
    expect(post.title).to be_a(String)
    
  end

  it 'has numerical views' do 
    post = Post.new(
      title: 'fake title',
      body: 'fake body',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
    post.views = '0'
    expect(post.views).not_to be_a(Integer)
    
  end
end
