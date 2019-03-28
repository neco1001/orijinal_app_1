class AddColumnToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :address, :string
  end
end
