class AddTimeLogColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :time_log, :string
  end
end
