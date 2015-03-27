class CmsController < ApplicationController
  def show
    @post = Post.where(permalink: params[:id]).first
    render template: "crowdblog/posts/show"
  end
end
