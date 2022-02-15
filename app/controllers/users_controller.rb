class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end

  def edit
  end
  
  def update
  end
end
