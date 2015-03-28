class RenameCrowdblogPostsToMiniblogPosts < ActiveRecord::Migration
  def change
    rename_table :crowdblog_posts, :miniblog_posts
  end
end
