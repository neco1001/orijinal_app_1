class AddFilterToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :filter, :string
  end
end
