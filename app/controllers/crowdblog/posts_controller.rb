class Crowdblog::PostsController < ApplicationController
  def index
    @posts = Crowdblog::Post.published
  end

  def show
    @post = Crowdblog::Post.where(permalink: params[:id]).first
  end
end
