Miniblog::Admin::PostsController.class_eval do
  def after_post_is_saved
    @post.purge_all
  end

  def post_params
    @params ||= params.require(:post).
                  permit(:title, :body, :updated_by, :ready_for_review, :transition,
                         :category_id, { asset: [ :attachment ]})
  end
end
