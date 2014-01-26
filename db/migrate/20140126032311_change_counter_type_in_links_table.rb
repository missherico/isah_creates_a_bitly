class ChangeCounterTypeInLinksTable < ActiveRecord::Migration
  def change
    change_column :links, :counter, :integer

  end
end
