class AddCmsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cms, :boolean, default: false
  end
end
