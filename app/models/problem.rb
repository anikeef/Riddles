class Problem < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :body, presence: true
  validates :answer, presence: true
end
