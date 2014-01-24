class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :rand_str
      t.string :counter

      t.timestamps
    end
  end
end
