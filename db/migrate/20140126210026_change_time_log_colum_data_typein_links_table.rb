class ChangeTimeLogColumDataTypeinLinksTable < ActiveRecord::Migration
  def change
  	change_column :links, :time_log, :string

  end
end
