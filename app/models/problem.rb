class Problem < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :restrict_blank_problem

  def answer?
    !answer.blank?
  end

  private

  def restrict_blank_problem
    if body.blank? && !picture?
      errors.add(:body, "can't be blank")
    end
  end
end
