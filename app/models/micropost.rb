class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }

  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader

end
