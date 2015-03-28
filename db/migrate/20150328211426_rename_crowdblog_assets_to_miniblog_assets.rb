class RenameCrowdblogAssetsToMiniblogAssets < ActiveRecord::Migration
  def change
    rename_table :crowdblog_assets, :miniblog_assets
  end
end
