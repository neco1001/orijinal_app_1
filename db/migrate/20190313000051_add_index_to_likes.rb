class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, [:user_id, :micropost_id], unique: true
  end
end
