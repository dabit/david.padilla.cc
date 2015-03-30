Miniblog::SitemapController.class_eval do
  def show
    @posts = Miniblog::Post.published_and_ordered
    @about = Miniblog::Post.about_me
  end
end
