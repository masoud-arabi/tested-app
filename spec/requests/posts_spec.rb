require 'rails_helper'

RSpec.describe "Posts", type: :request do
  current_user = User.first_or_create!(email: 'masoud@gmail.com', password: '123456', password_confirmation: '123456')
    let!(:valid_attributes) do
      {
        id: '1',
        title: 'title',
        body: 'valid body',
        user: current_user
      }
    end

    let!(:invalid_attributes) do
      {
        id: 'a',
        title: 'a',
        body: 'body'
      }
    end

  describe "GET /index" do
    it "render a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "render a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "render a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      post = Post.new(valid_attributes)
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context 'with valid attributes' do
      it "create a new post" do
        expect do
          post = Post.new(valid_attributes)
          post.user = current_user
          post.save
          post posts_url, params: {post: valid_attributes}
        end.to change(Post, :count).by(1)
      end
      it "redirect to the created post" do
        
        post posts_url, params: {post: valid_attributes}
        expect(response).to be_successful
      end
    end

    context 'with invalid attributes' do
      it "does not create a new post" do
        expect do
          
          post posts_url, params: {post: valid_attributes}
        end.to change(Post, :count).by(0)
      end
      it "redirect to the created post" do
       
          post posts_url, params: {post: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end


end
