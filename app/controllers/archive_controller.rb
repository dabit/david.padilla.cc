class ArchiveController < ApplicationController
  def index
    @posts = Post.published_and_ordered.where(cms: false)
  end
end
