class PreviewsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @post = Post.find(params[:id])
    render template: '/miniblog/posts/show'
  end
end
