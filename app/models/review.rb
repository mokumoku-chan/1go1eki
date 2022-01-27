class Review < ApplicationRecord

  validates :title, presence: true
  validates :comment, presence: true
  validates :evaluation, presence: true

end
