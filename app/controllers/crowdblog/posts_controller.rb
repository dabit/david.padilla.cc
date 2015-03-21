class Crowdblog::PostsController < ApplicationController
  def index
    @posts = ::Post.published_and_ordered.where(cms: false).limit(6)
    @featured_post = @posts.to_a.shift
  end

  def show
    @post = ::Post.where(id: params[:id]).first || ::Post.where(permalink: params[:id]).first
  end
end
