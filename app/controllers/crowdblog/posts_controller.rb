class Crowdblog::PostsController < ApplicationController
  def index
    @posts = Crowdblog::Post.published_and_ordered.where(cms: false)
  end

  def show
    @post = Crowdblog::Post.where(permalink: params[:id]).first
  end
end
