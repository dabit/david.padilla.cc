class Crowdblog::PostsController < ApplicationController
  def index
    @posts = Crowdblog::Post.all
  end
end
