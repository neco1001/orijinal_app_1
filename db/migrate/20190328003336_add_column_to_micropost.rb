class AddColumnToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :latitude, :decimal, :precision => 9, :scale => 6
    add_column :microposts, :longitude, :decimal, :precision => 9, :scale => 6
  end
end
