# Controller for post-related API endpoints
class Api::PostsController < ApplicationController
  # GET /api/posts
  def index
    posts = Post.includes(:user).all
    render json: posts.as_json(include: :user)
  end

  # GET /api/posts/:id
  def show
    post = Post.includes(:user).find(params[:id])
    render json: post.as_json(include: :user)
  end
end
