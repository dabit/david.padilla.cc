class CmsController < ApplicationController
  def show
    @post = Miniblog::Post.where(permalink: params[:id]).first
    render template: "miniblog/posts/show"
  end
end
