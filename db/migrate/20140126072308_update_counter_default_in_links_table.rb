class UpdateCounterDefaultInLinksTable < ActiveRecord::Migration
  def change
  	change_column :links, :counter, :integer, :default => 0

  end
end
