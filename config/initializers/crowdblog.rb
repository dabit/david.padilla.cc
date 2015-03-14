Crowdblog::Admin::PostsController.class_eval do
  def post_params
    params.require(:post).permit(:title, :body, :updated_by, :ready_for_review, :transition, :category_id)
  end
end

