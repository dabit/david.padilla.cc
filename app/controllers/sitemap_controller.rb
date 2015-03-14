class SitemapController < ApplicationController
  respond_to :xml

  def show
    @posts = Crowdblog::Post.published_and_ordered
    respond_with @posts
  end
end
