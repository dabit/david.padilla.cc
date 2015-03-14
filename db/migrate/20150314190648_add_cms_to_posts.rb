class AddCmsToPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :cms, :boolean, default: false
  end
end
