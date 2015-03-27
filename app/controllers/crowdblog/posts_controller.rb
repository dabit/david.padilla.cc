class Crowdblog::PostsController < ApplicationController
  def index
    @posts = ::Post.published_and_ordered.where(cms: false).limit(6)
    @post = @posts.to_a.shift
    @push_state = main_app.post_path(@post)
  end

  def show
    @post = ::Post.where(id: params[:id]).where(cms: false).first || ::Post.where(permalink: params[:id]).where(cms: false).first
    if @post
      @posts = []
      @posts << Post.published_and_ordered.where(cms: false).where("published_at < ?", @post.published_at).limit(2)
      @posts << Post.published_and_ordered.where(cms: false).where("published_at > ?", @post.published_at).limit(2)
      @posts = @posts.select { |p| !p.nil? }.flatten
    else
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
