class Miniblog::PostsController < ApplicationController
  before_filter :set_cache_control_headers

  def index
    @posts = Miniblog::Post.published_and_ordered.where(cms: false).limit(6)
    @post = @posts.to_a.shift
    @push_state = main_app.post_path(@post)
    set_surrogate_key_header Miniblog::Post.table_key
  end

  def show
    @post = Miniblog::Post.where(id: params[:id]).where(cms: false).first || ::Post.where(permalink: params[:id]).where(cms: false).first
    if @post
      set_surrogate_key_header @post.record_key
      @posts = []
      @posts << Miniblog::Post.published_and_ordered.where(cms: false).where("published_at < ?", @post.published_at).limit(2)
      @posts << Miniblog::Post.published_and_ordered.where(cms: false).where("published_at > ?", @post.published_at).limit(2)
      @posts = @posts.select { |p| !p.nil? }.flatten
    else
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
