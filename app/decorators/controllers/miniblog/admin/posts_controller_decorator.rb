Miniblog::Admin::PostsController.class_eval do
  def after_post_is_saved
    @post.purge_all
  end
end
