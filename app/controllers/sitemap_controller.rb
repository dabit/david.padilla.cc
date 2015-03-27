class SitemapController < ApplicationController
  respond_to :xml

  def show
    @posts = ::Post.published_and_ordered
    @about = ::Post.about_me
    respond_with @posts
  end
end
