class ArchiveController < ApplicationController
  def index
    @posts = Post.published_and_ordered.where(cms: false)
    set_surrogate_key_header Post.table_key
  end
end
