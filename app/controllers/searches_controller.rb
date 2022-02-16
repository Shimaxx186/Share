class SearchesController < ApplicationController

  def search
    @posts = Post.search(params[:search])
    @users = User.search(params[:search])
  end

end
