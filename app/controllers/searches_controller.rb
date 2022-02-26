class SearchesController < ApplicationController
  def search
    @users = []
    @posts = []
    if params[:word].present?

      @range = params[:range]

      if @range == "User"
        @users = User.search(params[:search], params[:word])
      else
        @posts = Post.search(params[:search], params[:word])
      end
    end
  end
end
