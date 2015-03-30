class CmsController < ApplicationController
  def show
    @post = Post.where(permalink: params[:id]).first
    render template: "miniblog/posts/show"
  end
end
