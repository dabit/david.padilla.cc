class Crowdblog::PostsController < ApplicationController
  def index
    @posts = Crowdblog::Post.published.where(cms: false).order("published_at DESC")
  end

  def show
    @post = Crowdblog::Post.where(permalink: params[:id]).first
  end
end
