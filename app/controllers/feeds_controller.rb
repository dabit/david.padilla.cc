class FeedsController < ApplicationController
  def show
    @posts = Miniblog::Post.all_for_feed
  end
end
