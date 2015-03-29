class DropCrowdblogStatusChangeRecords < ActiveRecord::Migration
  def change
    drop_table :crowdblog_status_change_records
  end
end
