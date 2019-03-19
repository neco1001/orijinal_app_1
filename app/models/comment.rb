class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, :counter_cache => true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
