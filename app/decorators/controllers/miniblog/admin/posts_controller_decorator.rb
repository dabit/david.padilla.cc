Miniblog::Admin::PostsController.class_eval do
  def after_post_is_saved
    if Rails.env.production? && @post.published?
      @post.purge_all
      @post.purge
    else
      Rails.logger.debug("Purge Cache: #{@post.table_key}")
      Rails.logger.debug("Purge Cache: #{@post.record_key}")
    end
  end

  def post_params
    @params ||= params.require(:post).
                  permit(:title, :body, :updated_by, :ready_for_review, :transition,
                         :category_id, { asset: [ :attachment ]})
  end
end
