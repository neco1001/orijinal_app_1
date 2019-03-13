class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, :counter_cache => true
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates_uniqueness_of :user_id, scope: :micropost_id
end
