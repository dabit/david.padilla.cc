class ArchiveController < ApplicationController
  def index
    @posts = Miniblog::Post.published_and_ordered.where(cms: false)
    set_surrogate_key_header Miniblog::Post.table_key
  end
end
