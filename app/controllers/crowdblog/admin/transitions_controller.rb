class Crowdblog::Admin::TransitionsController < Crowdblog::Admin::BaseController
  respond_to :json
  before_filter :load_post, only: [:create]

  def create
    namespace = '_as_publisher' if current_user.is_publisher?
    @post.send "#{params[:transition]}#{namespace}"
    status = @post.status_change_records.build(user: current_user, state: params[:transition])
    status.save
    @post.purge_all
    respond_with @post, location: admin_post_url(@post)
  end

  private

  def load_post
    post  = ::Post.scoped_for(current_user).find(params[:id])
    @post = Crowdblog::PostPresenter.new(post, current_user)
  end
end
