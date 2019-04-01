class Riddle < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :answer, presence: true
end
