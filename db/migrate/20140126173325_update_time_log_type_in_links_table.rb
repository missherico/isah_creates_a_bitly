class UpdateTimeLogTypeInLinksTable < ActiveRecord::Migration
  def change
  	change_column :links, :time_log, :timestamp
  end
end