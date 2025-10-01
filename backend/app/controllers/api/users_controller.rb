# Controller for user-related API endpoints
class Api::UsersController < ApplicationController
  # GET /api/users
  def index
    users = User.all
    render json: users
  end

  # GET /api/users/:id
  def show
    user = User.find(params[:id])
    render json: user
  end
end
