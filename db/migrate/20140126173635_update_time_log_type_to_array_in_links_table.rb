class UpdateTimeLogTypeToArrayInLinksTable < ActiveRecord::Migration
  def change
  	  	change_column :links, :time_log, :datetime

  end
end
